class TransActionsController < ApplicationController

    rescue_from ActionController::ParameterMissing, with: :render_bad_request
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found
    before_action :check_content_type, only: [:create, :update]

    def index 
        trans_action = TransAction.all
        render json: {transaction: trans_action}, status: :ok
    end


    def show 
        trans_action = find_transaction
        render json: {transaction_id: trans_action.id, account_id: trans_action.account_id, amount: trans_action.amount, status: :ok }
    end

    def create 
        trans_action = TransAction.find_by(account_id: params[:account_id])
        if trans_action
            change = trans_action.amount + params[:amount]
            trans_action.account.update!(balance: change)
            trans_action.update!(amount: params[:amount])
            render json: {account_id:trans_action.account.id, amount:trans_action.amount,  transaction_id: trans_action.id}, status: :created
        else   
            account_id = params[:account_id] if is_blob?(params[:account_id])
            account =Account.new(id: account_id, balance: params[:amount])         
            if account.save
            account_id = params[:account_id] if is_blob?(params[:account_id])
            account.trans_actions.create!(trans_actions_params)
            render json: {account_id:account.id, amount:account.trans_actions[0].amount,  transaction_id: account.trans_actions[0].id}, status: :created
            else
                render json: { error: "Bad Request: Missing required parameters" }, status: :bad_request
            end
            
        end
    end

    def update
        trans_action = find_transaction
        TransAction.update!(update_params)
        render json: trans_action, status: :ok
    end

    def destroy 
        trans_action = find_transaction
        trans_action.destroy
        head :no_content
    end

    def method_not_allowed
        render json: { error: "Method Not Allowed: PUT requests are not allowed for this route" }, status: :method_not_allowed
    end

    private

    def update_params
       params.permit(:amount) 
    end

    def find_transaction
        TransAction.find(params[:id])  
    end

    def render_response_not_found
        render json:{error: ["Resource not found"]}, status: :not_found
    end

    def render_unprocessable_entity(invalid)
        render json: {error: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def trans_actions_params
        params.permit(:amount).to_h

    end

    def check_content_type
        unless request.content_type == "application/json"
          render json: { error: "Unsupported Content-Type. Only application/json is allowed." }, status: :unsupported_media_type
        end
      end
    
      def is_blob?(data)
        data.present? && data.to_s.bytesize >= 36
      end

end

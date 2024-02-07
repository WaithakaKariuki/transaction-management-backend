class AccountsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found
    before_action :check_content_type, only: [:create, :update]
    def index 
        account = Account.all
        render json: account, include: ['transactions']
    end


    def show 
        account = Account.find(params[:id])

        render json: account, status: :ok, include: ['trans_actions']
    end
# {account_id: account.id, balance: account.balance}, 
    def create 
        account = Account.find_by(id: params[:account_id])
        if account
            subtract = (params[:amount]).to_int < 0 ? account.trans_actions[-1].amount + params[:amount] : params[:amount]
            account.update!(balance: subtract)
            account.trans_actions.create!(amount: subtract)
            render json: {account_id: account.id, amount:account.trans_actions[-1].amount,  transaction_id: account.trans_actions[0].id}, status: :created
        else
            account =Account.create!(id: params[:account_id], balance: params[:amount])
            account.trans_actions.create!(trans_actions_params)
            render json: {account_id: account.id, amount:account.trans_actions[0].amount,  transaction_id: account.trans_actions[0].id}, status: :created
        end
    end

    # def update
    #     account = Account.find(params[:id])
    #     account.update!(update_account_params)
    #     render json: account, status: :ok
    # end
    
    # def destroy 
    #     account = Account.find(params[:id])
    #     account.destroy
    #     head :no_content
    # end

    private
    def render_response_not_found
        render json:{error: ["Resource not found"]}, status: :not_found 
    end

    def render_unprocessable_entity(invalid)
        render json: {error: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def account_params
        params.permit(:balance).to_h
    end

    def trans_actions_params
        params.permit(:amount).to_h

    end

    def check_content_type
        unless request.content_type == "application/json"
          render json: { error: "Unsupported Content-Type. Only application/json is allowed." }, status: :unsupported_media_type
        end
      end

end

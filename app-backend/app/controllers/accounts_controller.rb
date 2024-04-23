class AccountsController < ApplicationController

    rescue_from ActionController::ParameterMissing, with: :render_bad_request
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found
    before_action :check_content_type, only: [:create, :update]

    def index 
        account = Account.all
        render json: account
    end

    def show 
        account = find_account
        render json: {account_id: account.id, balance: account.balance}, status: :ok
    end

    def create 
        account = Account.create!(account_params)
        render json: account, status: :created
    end

    def update
        account = find_account
        account.update!(update_account_params)
        render json: account, status: :ok
    end
    
    def destroy 
        account = find_account
        account.destroy
        head :no_content
    end

    private

    def find_account
        Account.find(params[:id])
    end

    def render_response_not_found
        render json:{error: ["Resource not found"]}, status: :not_found 
    end

    def render_unprocessable_entity(invalid)
        render json: {error: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_bad_request
        render json: { error: "Bad Request: Missing required parameters" }, status: :bad_request
    end

    def account_params
        params.permit(:balance).to_h
    end

    def check_content_type
        unless request.content_type == "application/json"
          render json: { error: "Unsupported Content-Type. Only application/json is allowed." }, status: :unsupported_media_type
        end
      end

end

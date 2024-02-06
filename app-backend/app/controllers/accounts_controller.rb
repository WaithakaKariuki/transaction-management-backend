class AccountsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found

    def index 
        account = Account.all
        render json: account, include: ['transactions']
    end


    def show 
        account = Account.find(params[:id])
        render json: account, status: :ok
    end

    def create 
        account =Account.create!(account_params)
        render json: account, status: :created
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
        params.permit(:balance, :transaction_ids)
    end

end

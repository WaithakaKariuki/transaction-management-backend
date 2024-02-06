class TransactionsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found

    def index 
        transaction = Transaction.all
        render json: transaction, status: :ok
    end


    def show 
        transaction = Transaction.find(params[:id])
        render json: transaction, status: :ok
    end

    def create 
        transaction = Transaction.create!(transaction_params)
        render json: transaction, status: :created
    end

    private
    def render_response_not_found
        render json:{error: ["Resource not found"]}, status: :not_found 
    end

    def render_unprocessable_entity(invalid)
        render json: {error: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def transaction_params
        params.permit(:amount, :account_ids)
    end

end

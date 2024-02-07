class TransActionsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found

    def index 
        trans_action = TransAction.all
        render json: {transaction: trans_action}, status: :ok
    end


    def show 
        trans_action = TransAction.find(id: params[:transaction_id])
        render json: trans_action, status: :ok
    end

    def create 
        trans_action = TransAction.create!(trans_action_params)
        render json: {transaction: trans_action, transaction_id: trans_action.id}, status: :created
    end

    def destroy 
        trans_action = TransAction.find(params[:id])
        trans_action.destroy
        head :no_content
    end

    private
    def render_response_not_found
        render json:{error: ["Resource not found"]}, status: :not_found 
    end

    def render_unprocessable_entity(invalid)
        render json: {error: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def trans_action_params
        params.permit(:amount, :account_ids).to_h
    end

end

class TransActionsController < ApplicationController

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
    rescue_from ActiveRecord::RecordNotFound, with: :render_response_not_found

    def index 
        trans_action = TransAction.all
        render json: {transaction: trans_action}, status: :ok
    end


    def show 
        # byebug
        trans_action = TransAction.find(params[:id])
        render json: {transaction_id: trans_action.id, account_id: trans_action.account_id, amount: trans_action.amount, status: :ok }
    end

    def create 
        # byebug
        # account_id = Account.find_by(id: params[:account_id])
        trans_action = TransAction.create!(trans_action_params)
        render json: {transaction_id: trans_action.id, status: :created}
    end

    # trans_action = TransAction.create!(trans_action_params.merge(account_id: params[:account_id]))

    # def update
    #     update_params = { 
    #         amount: params[:amount]}
    #     trans_action = TransAction.find(params[:id])
    #     TransAction.update!(update_params)
    #     render json: trans_action, status: :ok
    # end

    def destroy 
        trans_action = TransAction.find(id: params[:transaction_id])
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
        params.permit(:account_id, :amount)
    end

end
# (account_id: params[:account_id], amount: params[:amount])
class AccountTransActionsController < ApplicationController
    account_trans_actions = AccountTransActions.where(account_id: params[:account_id])
end

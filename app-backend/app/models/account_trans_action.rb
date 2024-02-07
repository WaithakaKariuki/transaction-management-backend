class AccountTransAction < ApplicationRecord

    # attribute :account_id, :uuid_v7 
    # attribute :trans_action_id, :uuid_v7 

    belongs_to :account
    belongs_to :trans_action
end

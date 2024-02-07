class TransAction < ApplicationRecord
    # self.primary_key ="id" 
    # has_many :account_trans_actions, foreign_key: "trans_action_id"
    has_many :account_trans_actions
    has_many :accounts, through: :account_trans_actions
end

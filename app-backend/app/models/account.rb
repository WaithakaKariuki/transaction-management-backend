class Account < ApplicationRecord
    # self.primary_key ="id" 
    # has_many :account_trans_actions, foreign_key: "account_id"
    has_many :account_trans_actions
    has_many :trans_actions, through: :account_trans_actions
end

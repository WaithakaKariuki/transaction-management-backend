class Account < ApplicationRecord
    has_many :trans_actions

    validates :balance, presence: true
    validates :id, presence: true
end

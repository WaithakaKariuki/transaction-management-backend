class Transaction < ApplicationRecord
    has_many :account_transactions
end

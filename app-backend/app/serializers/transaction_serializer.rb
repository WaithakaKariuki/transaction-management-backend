class TransactionSerializer < ActiveModel::Serializer
  attributes :created_at, :id, :amount

  has_many :account_transactions
end

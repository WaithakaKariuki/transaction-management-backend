class AccountTransactionSerializer < ActiveModel::Serializer
  attributes :account_id, :transaction_id
end

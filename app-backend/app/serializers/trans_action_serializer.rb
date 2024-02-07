class TransActionSerializer < ActiveModel::Serializer
  attributes :created_at, :amount, :id, :account_id

  belongs_to :account
end

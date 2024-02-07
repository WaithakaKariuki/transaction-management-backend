class TransActionSerializer < ActiveModel::Serializer
  attributes :created_at,:amount

  has_many :accounts
end

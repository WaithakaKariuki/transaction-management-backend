class AccountSerializer < ActiveModel::Serializer
  attributes :balance, :id

  has_many :trans_actions
end

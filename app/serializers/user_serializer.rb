class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :email
  has_many :diary_cards
  has_many :trackers
end

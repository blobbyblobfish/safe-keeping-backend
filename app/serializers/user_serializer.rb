class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :email, :created_at
  has_many :coping_skills
  has_many :diary_cards
  has_many :emergency_contacts
  has_many :trackers
end

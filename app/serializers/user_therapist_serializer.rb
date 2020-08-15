class UserTherapistSerializer < ActiveModel::Serializer
  attributes :id, :therapist_id, :user_id
  has_one :therapist
end

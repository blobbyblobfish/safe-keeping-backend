class Therapist < ApplicationRecord
    has_secure_password
    has_many :user_therapists, dependent: :destroy
    has_many :users, through: :user_therapists
end

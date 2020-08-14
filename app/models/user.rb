class User < ApplicationRecord
    has_secure_password

    has_many :coping_skills, dependent: :destroy
    has_many :diary_cards, dependent: :destroy
    has_many :emergency_contacts, dependent: :destroy
    has_many :trackers, dependent: :destroy
    
    has_many :user_therapists, dependent: :destroy
    has_many :therapists, through: :user_therapists

end

class User < ApplicationRecord
    has_secure_password
    has_many :diary_cards, dependent: :destroy
    has_many :trackers, dependent: :destroy   
end

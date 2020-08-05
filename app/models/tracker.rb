class Tracker < ApplicationRecord
  belongs_to :user
  has_many :diary_card_trackers, dependent: :destroy
end

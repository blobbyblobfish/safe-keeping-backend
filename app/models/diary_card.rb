class DiaryCard < ApplicationRecord
  belongs_to :user
  has_many :diary_card_trackers
end

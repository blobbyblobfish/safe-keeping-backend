class DiaryCardTracker < ApplicationRecord
  belongs_to :diary_card
  belongs_to :tracker
end

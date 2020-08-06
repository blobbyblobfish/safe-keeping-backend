class DiaryCardSerializer < ActiveModel::Serializer
    attributes :thoughts, :feelings, :created_at
    has_many :diary_card_trackers
end
  
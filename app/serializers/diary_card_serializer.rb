class DiaryCardSerializer < ActiveModel::Serializer
    attributes :id, :thoughts, :feelings, :created_at
    has_many :diary_card_trackers
end
  
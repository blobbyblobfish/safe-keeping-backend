class DiaryCardSerializer < ActiveModel::Serializer
    has_many :diary_card_trackers
    attributes :id, :thoughts, :feelings, :created_at
end
  
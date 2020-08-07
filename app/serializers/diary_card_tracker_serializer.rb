class DiaryCardTrackerSerializer < ActiveModel::Serializer
    attributes :id, :score
    belongs_to :tracker
  end
  
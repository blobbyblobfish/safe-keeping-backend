class DiaryCardTrackerSerializer < ActiveModel::Serializer
    attributes :score
    belongs_to :tracker
  end
  
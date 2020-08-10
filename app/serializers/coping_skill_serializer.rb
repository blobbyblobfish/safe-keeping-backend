class CopingSkillSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :directions, :attempts, :successful_attempts
end

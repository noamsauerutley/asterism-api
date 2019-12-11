class StorySerializer < ActiveModel::Serializer
  attributes :id, :author_id, :title, :summary
end

class StoryNoteSerializer < ActiveModel::Serializer
    attributes :id, :story_id, :text
  end
  
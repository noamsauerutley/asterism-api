class AppearanceSerializer < ActiveModel::Serializer
  attributes :id, :scene_id, :character_id, :appearance_notes

  def appearance_notes
    self.object.appearance_notes.map do |appearance_note|
      {
        id: appearance_note.id,
        text: appearance_note.text
      }
    end
  end
end

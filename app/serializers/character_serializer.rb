class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :story_id, :name, :description, :character_notes, :images, :appearances, :scenes, :images

  def character_notes
    self.object.character_notes.map do |character_note|
      {
        id: character_note.id,
        character_id: character_note.character_id,
        text: character_note.text
      }
    end
  end

  def appearances
    self.object.images.map do |image|
      {
        id: image.id,
        character_id: image.character_id,
        image_url: image.image_url,
        note: image.note
      }
    end
  end

  def appearances
    self.object.appearances.map do |appearance|
      {
        id: appearance.id,
        scene_id: appearance.scene_id,
        character_id: appearance.character_id,
        appearance_notes: appearance.appearance_notes
      }
    end
  end

  def scenes
    self.object.scenes.map do |scene|
      {
        name: scene.name
      }
    end
  end

  def images
    self.object.images.map do |image|
      {
        image_url: image.image_url
      }
    end
  end
end

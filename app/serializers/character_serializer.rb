class CharacterSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :character_notes, :gallery, :appearances

  def gallery
    {
      id: self.object.gallery.id,
      images: self.object.gallery.images
  }
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
end

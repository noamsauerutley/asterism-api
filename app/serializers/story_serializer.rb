class StorySerializer < ActiveModel::Serializer
  attributes :id, :author_id, :title, :summary, :plots, :characters, :story_notes

  def plots
    self.object.plots.map do |plot|
      {
        id: plot.id,
        story_id: plot.story_id,
        name: plot.name,
        summary: plot.summary,
        notes: plot.plot_notes,
        scenes: plot.scenes
      }
    end
  end

  def characters
    self.object.characters.map do |character|
      {
        id: character.id,
        story_id: character.story_id,
        name: character.name,
        description: character.description,
        character_notes: character.character_notes, 
        images: character.images, 
        appearances: character.appearances
      }
    end
  end

  def story_notes
    self.object.story_notes.map do |story_note|
      {id: story_note.id,
      text: story_note.text}
    end
  end
end

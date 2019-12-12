class StorySerializer < ActiveModel::Serializer
  attributes :id, :author_id, :title, :summary, :plots, :characters

  def plots
    self.object.plots.map do |plot|
      {
        id: plot.id,
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
        name: character.name,
        description: character.description,
        gallery: character.gallery
      }
    end
  end
end

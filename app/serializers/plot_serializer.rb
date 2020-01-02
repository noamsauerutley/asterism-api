class PlotSerializer < ActiveModel::Serializer
  attributes :id, :story_id, :name, :summary, :plot_notes, :scenes

  def scenes
    self.object.scenes.map do |scene|
      {
        id: scene.id,
        name: scene.name,
        summary: scene.summary,
        characters: scene.characters,
      }
    end
  end

end

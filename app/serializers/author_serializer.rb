class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :image_url, :bio, :stories, :fragments

  def stories
    self.object.stories.map do |story|
      {id: story.id,
      title: story.title,
      summary: story.summary,
      plots: story.plots.map do |plot|
        {
          id: plot.id,
          story_id: plot.story_id,
          name: plot.name,
          summary: plot.summary,
          plot_notes: plot.plot_notes,
          scenes: plot.scenes.map do |scene|
              {
                id: scene.id,
                plot_id: scene.plot_id,
                name: scene.name,
                summary: scene.summary,
                characters: scene.characters
              }
          end
        }
      end,
      characters: story.characters.map do |character|
        {id: character.id,
        name: character.name,
        description: character.description,
        character_notes: character.character_notes,
        appearances: character.appearances,
        scenes: character.scenes,
        images: character.images}
      end
    }
    end
  end

  def fragments
    self.object.fragments.map do |fragment|
      {id: fragment.id,
      title: fragment.title,
      text: fragment.text,
      fragment_notes: fragment.fragment_notes}
    end
  end

end

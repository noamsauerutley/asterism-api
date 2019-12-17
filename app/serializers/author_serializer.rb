class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :image_url, :bio, :stories, :fragments

  def stories
    self.object.stories.map do |story|
      {id: story.id,
      title: story.title,
      summary: story.summary,
      plots: story.plots,
      characters: story.characters
    }
    end
  end

  def fragments
    self.object.fragments.map do |fragment|
      {id: fragment.id,
      title: fragment.title,
      text: fragment.text,
      notes: fragment.fragment_notes}
    end
  end

end

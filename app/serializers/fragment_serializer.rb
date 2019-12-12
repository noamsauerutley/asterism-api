class FragmentSerializer < ActiveModel::Serializer
  attributes :id, :author_id, :title, :text, :fragment_notes

  def fragment_notes
    self.object.fragment_notes.map do |fragment_note|
      {id: fragment_note.id,
      text: fragment_note.text}
    end
  end
end

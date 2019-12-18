class GallerySerializer < ActiveModel::Serializer
  attributes :id, :character_id, :images

  def images
    self.object.images.map do |image|
      {
        id: image.id,
        image_url: image.image_url
    }
    end
  end
end

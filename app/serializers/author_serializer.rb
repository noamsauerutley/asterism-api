class AuthorSerializer < ActiveModel::Serializer
  attributes :id, :username, :password, :email, :image_url, :bio
end

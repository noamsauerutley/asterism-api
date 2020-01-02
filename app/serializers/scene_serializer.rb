class SceneSerializer < ActiveModel::Serializer
  attributes :id, :plot_id, :name, :summary, :characters
end

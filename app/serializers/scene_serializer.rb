class SceneSerializer < ActiveModel::Serializer
  attributes :id, :plot_id, :name, :summary, :appearances
end

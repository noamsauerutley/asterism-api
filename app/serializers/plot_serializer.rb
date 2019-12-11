class PlotSerializer < ActiveModel::Serializer
  attributes :id, :story_id, :name, :summary
end

class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :synopsis
  belongs_to :director
end

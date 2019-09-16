class MovieSerializer < ActiveModel::Serializer
  attributes :id, :title, :release_year, :starring, :synopsis, :image
  belongs_to :director
  has_many :users
end

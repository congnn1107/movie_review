class MovieSerializer < ApplicationSerializer
  attributes :poster, :name, :slug, :premiere_at, :describe
  has_many :posts, serializer: PostInMovieSerializer
  def poster
    rails_blob_url(object.poster) if object.poster.attached?
  end

  def premiere_at
    object.premiere_at.strftime('%d-%m-%Y')
  end
end

class PostInMovieSerializer < ApplicationSerializer
  include Url
  attributes :title, :cover, :published_at, :url
end
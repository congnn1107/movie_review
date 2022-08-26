class PostSerializer < ApplicationSerializer
  include Url
  attributes :title, :content, :cover, :url
  belongs_to :movie
  belongs_to :user
  def cover
    rails_blob_url(object.cover) if object.cover.attached?
  end
end

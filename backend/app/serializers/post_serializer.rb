class PostSerializer < ApplicationSerializer
  attributes :title, :content, :cover, :url
  belongs_to :movie
  belongs_to :user
  def cover
    rails_blob_url(object.cover) if object.cover.attached?
  end

  def url
    api_v1_public_post_url(object)
  end
end

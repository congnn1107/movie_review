module Url
  extend ActiveSupport::Concern
  
  def url
    api_v1_public_post_url(object)
  end
end

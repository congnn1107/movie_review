module Slug
  extend ActiveSupport::Concern
  CLASS_ATTRS = { "Movie" => "name", "Post" => "title" }

  def set_slug
    self.slug = self.send(CLASS_ATTRS[self.class.name]).parameterize + "-" + SecureRandom.urlsafe_base64(5)
  end
end

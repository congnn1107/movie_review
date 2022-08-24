module Movies
  module Slug
    extend ActiveSupport::Concern

    def set_slug
      self.slug = self.name.parameterize + "-" + SecureRandom.urlsafe_base64(5)
    end
  end
end

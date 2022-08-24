require "jwt"

module Users
  module Token
    extend ActiveSupport::Concern

    def generate_token()
      JWT.encode({ id: id, exp: 15.days.from_now.to_i }, Rails.application.secrets.secret_key_base)
    end
  end
end

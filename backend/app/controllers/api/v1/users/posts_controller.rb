module Api
  module V1
    module Users
      class PostsController < BaseController
        include Api::V1::Concerns::PostsManagement
        before_action :set_post, except: [:index, :create]
        before_action :authorize_user, except: [:create]
      end
    end
  end
end

module Api
  module V1
    module Admin
      class PostsController < BaseController

        include Api::V1::Concerns::PostsManagement

        before_action :admin_user
        before_action :authorize_user, except: [:index, :publish, :create]

        def index
          json_response(Post.all)
        end

        def publish
          @post.publish
          json_response(@post)
        end
      end
    end
  end
end

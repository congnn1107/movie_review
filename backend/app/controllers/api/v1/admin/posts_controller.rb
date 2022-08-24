module Api
  module V1
    module Admin
      class PostsController < Api::V1::Users::PostsController
        before_action :admin_user
        skip_before_action :authorize_user, only: [:index, :publish]

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

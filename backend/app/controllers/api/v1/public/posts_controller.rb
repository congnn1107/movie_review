module Api
  module V1
    module Public
      class PostsController < BaseController
        def index
          posts = Post.published.includes(:movie)

          json_response(posts)
        end

        def show
          @post = Post.find_by(slug: params["id"])
          json_response @post
        end

        def vote
        end
      end
    end
  end
end

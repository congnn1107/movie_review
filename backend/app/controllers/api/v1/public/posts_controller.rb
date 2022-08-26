module Api
  module V1
    module Public
      class PostsController < BaseController
        before_action :set_post, except: :index
        
        def index
          posts = Post.published.includes(:movie)

          json_response(posts)
        end

        def show
          json_response @post
        end

        private

        def set_post
          begin
            @post = Post.find_by(slug: params[:slug])
            raise ActiveRecord::RecordNotFound if @post.nil?

          rescue ActiveRecord::RecordNotFound => exception
            json_response({ error: "Can not find this post!" },nil, :not_found)
          end
        end
      end
    end
  end
end

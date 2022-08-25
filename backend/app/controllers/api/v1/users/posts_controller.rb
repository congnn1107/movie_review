module Api
  module V1
    module Users
      class PostsController < BaseController
        before_action :set_post, except: [:index, :create]
        before_action :authorize_user, except: [:create]

        def index
          json_response(@current_user.posts)
        end

        def create
          post = @current_user.posts.new(post_params)
          if post.save
            post.attach_an_image(params[:cover])

            json_response(post)
          else
            json_response({ error: post.errors.full_messages }, :unprocessable_entity)
          end
        end

        def show
          json_response(@post)
        end

        def update
          if @post.update(post_params)
            @post.attach_an_image(params[:cover])
            json_response(@post)
          else
            json_response({ error: @post.errors.full_messages }, :unprocessable_entity)
          end
        end

        def destroy
          @post.destroy
          json_response({ message: "Deleted" })
        end

        protected

        def set_post
          begin
            @post = Post.find(params[:id])
          rescue ActiveRecord::RecordNotFound => exception
            json_response({ error: "Could not find any post by this id!" }, :not_found)
          end
        end

        def post_params
          params.permit(:title, :content, :movie_id)
        end
      end
    end
  end
end

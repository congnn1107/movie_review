module Api
  module V1
    module Concerns
      module VotePost
        def create
          @post.votes.create(user_id: @current_user.id, is_agree: params[:is_agree])
          puts "success"
          json_response({ message: "Success" })
        end

        def update
          vote = @post.votes.where(user_id: @current_user.id)
          json_response(vote)
        end

        def destroy

        end

        private

        def set_post
          @post = Post.find_by(slug: params[:slug])
          puts @post
          json_response({ error: "Can not find this post!" }, nil, :not_found) if @post.nil?
        end
      end
    end
  end
end

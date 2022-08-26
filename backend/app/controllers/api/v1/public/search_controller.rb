module Api
  module V1
    module Public
      class SearchController < BaseController
        def index
          posts = Post.ransack(title_cont: params[:q]).result
          json_response(posts)
        end
      end
    end
  end
end

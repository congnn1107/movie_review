module Api
  module V1
    module Public
      class MoviesController < BaseController
        def index
          json_response(Movie.all)
        end

        def show
          json_response(Movie.includes(:posts).find(params[:id]))
        end
      end
    end
  end
end

module Api
  module V1
    module Users
      class MoviesController < BaseController
        def index
          json_response(Movie.all, "FullMovieSerializer")
        end
      end
    end
  end
end

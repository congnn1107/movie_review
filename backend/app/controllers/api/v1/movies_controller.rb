module Api
  module V1
    class MoviesController < ApplicationController
      def index
        json_response(Movie.all)
      end

      def show
        json_response(Movie.find(params[:id]))
      end
    end
  end
end

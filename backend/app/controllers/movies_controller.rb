class MoviesController < ApplicationController
  skip_before_action :authenticate_user, only: [:index, :show]
  before_action :set_movie, only: [:show, :update, :destroy]
  before_action :admin_user, only: [:create, :update, :destroy]

  def index
    json_response(Movie.all)
  end

  def create
    movie = Movie.new(movie_params)
    movie.slug = movie.name.parameterize + "-" + SecureRandom.urlsafe_base64(5)
    movie.poster.attach(params[:poster]) unless params[:poster].nil?

    if movie.save
      json_response(movie)
    else
      json_response({ error: movie.errors.full_messages })
    end
  end

  def show
    json_response(@movie)
  end

  def update
    if @movie && @movie.update(movie_params)
      movie.poster.attach(params[:poster]) unless params[:poster].nil?

      json_response(@movie)
    else
      json_response(error: @movie.errors.full_messages)
    end
  end

  def destroy
    @movie.destroy
    json_response({ message: "Deleted" })
  end

  private

    def set_movie
      begin
        @movie = Movie.find(params[:id])
      rescue ActiveRecord::RecordNotFound => exception
        json_response({ error: "Could not find any movies by this id!" }, :not_found)
      end
    end

    def movie_params
      params.permit(:name, :premiere_at, :describe)
    end
end

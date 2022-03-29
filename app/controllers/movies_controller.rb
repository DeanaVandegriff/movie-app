class MoviesController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    movies = Movie.all
    render :index
  end

  def show
    movie_id = params["id"]
    movie = Movie.find_by(id: movie_id)
    render :show
  end

  def create
    movie = Movie.new(
      title: params["title"],
      year: params["year"],
      plot: params["plot"],
      director: params["director"],
      english: params["english"],
    )
    if movie.save
      render json: movie.as_json
    else
      render json: { error: movie.errors.full_messages }, status: 422
    end
  end

  def update
    movie_id = params["id"]
    movie = Movie.find_by(id: movie_id)
    movie.title = params["title"] || movie.title
    movie.year = params["year"] || movie.year
    movie.plot = params["plot"] || movie.plot
    movie.director = params["director"] || movie.director
    movie.english = params["english"] || movie.english
    movie.save
    render json: movie.as_json
  end

  def destroy
    movie_id = params["id"]
    movie = Movie.find_by(id: movie_id)
    movie.destroy
    render json: { message: "successful database removal" }
  end
end

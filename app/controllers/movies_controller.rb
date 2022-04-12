class MoviesController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @movies = Movie.all
    render :index
  end

  def show
    @movie = Movie.find(params[:id])
    render :show
  end

  def create
    @movie = Movie.create(
      title: params[:title],
      year: params[:year],
      plot: params[:plot],
      director: params[:director],
      english: params[:english],
    )
    if @movie.save
      render :show
    else
      render json: { error: movie.errors.objects.first.full_message }, status: 422
    end
  end

  def destroy
    movie = Movie.destroy(params[:id])
    render json: { message: "Movie has been deleted." }
  end

  def update
    @movie = Movie.find(params[:id])
    @movie = Movie.find(params[:id])
    @movie.title = params[:title] || movie.title
    @movie.year = params[:year] || movie.year
    @movie.plot = params[:plot] || movie.plot
    @movie.director = params[:director] || movie.director
    @movie.english = params[:english] || movie.english
    if @movie.save
      render :show
    else
      render json: { error: movie.errors.objects.first.full_message }, status: 422
    end
  end
end

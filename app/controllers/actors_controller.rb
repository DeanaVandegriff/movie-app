class ActorsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @actors = Actor.all
    render template: "actors/index"
  end

  def show
    @actor = Actor.find(params[:id])
    render template: "actors/show"
  end

  def create
    @actor = Actor.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      known_for: params[:known_for],
      gender: params[:gender],
      age: params[:age],
      movie_id: params[:movie_id],
    )
    if @actor.save
      render template: "actors/show"
    else
      render json: { error: @actor.errors.objects.first.full_message }, status: 422
    end
  end

  def destroy
    actor = Actor.destroy(params[:id])
    render json: { message: "Actor has been deleted." }
  end

  def update
    @actor = Actor.find(params[:id])
    @actor.title = params[:title] || @actor.title
    @actor.year = params[:year] || @actor.year
    @actor.plot = params[:plot] || @actor.plot
    @actor.gender = params[:gender] || @actor.gender
    @actor.movie_id = params[:movie_id] || @actor.movie_id
    if @actor.save
      render template: "actors/show"
    else
      render json: { error: @actor.errors.objects.first.full_message }, status: 422
    end
  end
end

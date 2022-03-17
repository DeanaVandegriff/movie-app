class ActorsController < ApplicationController
  def index
    actors = Actor.all
    render json: actors.as_json
  end

  def show
    actor_id = params["id"]
    actor = Actor.find_by(id: actor_id)
    render json: actor.as_json
  end

  def create
    actor = Actor.new(
      first_name: params["first_name"],
      last_name: params["last_name"],
      known_for: params["known_for"],
      gender: params["gender"],
      age: params["age"],
    )
    actor.save
    render json: actor.as_json
  end

  def update
    actor_id = params["id"]
    actor = Actor.find_by(id: actor_id)
    actor.first_name = params["first_name"] || actor.first_name
    actor.last_name = params["last_name"] || actor.last_name
    actor.known_for = params["known_for"] || actor.known_for
    actor.gender = params["gender"] || actor.gender
    actor.age = params["age"] || actor.age
    actor.save
    render json: actor.as_json
  end

  def destroy
    actor_id = params["id"]
    actor = Actor.find_by(id: actor_id)
    actor.destroy
    render json: { message: "successfully destroyed!" }
  end
end

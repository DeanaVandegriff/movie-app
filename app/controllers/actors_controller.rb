class ActorsController < ApplicationController
  def one_actor
    actor_id = params["id"]
    actor = Actor.find_by(id: actor_id)
    render json: actor.as_json
  end
end

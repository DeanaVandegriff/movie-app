class ActorsController < ApplicationController
  def one_actor
    actor = Actor.find(2)
    render json: actor.as_json
  end
end

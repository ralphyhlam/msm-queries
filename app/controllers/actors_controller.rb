class ActorsController < ApplicationController
  def all_actors
    render({:template => "actors_templates/all_actors"})
  end

  def actor_details
    @actor_choice = params.fetch("actor_id").to_i
    @actor_details = Actor.where({ :id => @actor_choice }).at(0)
    @acting_history = Character.where({ :actor_id => @actor_choice})

    #to relate movie to characters, we need to use movie id and character id together
    render({:template => "actors_templates/more_actors"})
  end
end

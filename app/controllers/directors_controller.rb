class DirectorsController < ApplicationController
  def all_directors
    render({ :template => "directors_templates/all_directors"})
  end

  def learn_more
    @director_choice = params.fetch("director_id").to_i
    @details = Director.where({ :id => @director_choice }).at(0)
    #movie where :director_id is director_choice to list all relevant movie entries
    @filmography = Movie.where({:director_id => @director_choice})
    
    render({ :template => "directors_templates/more"})
  end
end

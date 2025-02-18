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

  def youngest
    formatted_youngest = Director.where.not({:dob => nil }).order({:dob => :desc})
    @pull_youngest = formatted_youngest.at(0)
    @youngest_name = @pull_youngest.name 
    @youngest_dob_MD = @pull_youngest.dob.strftime("%B %e")
    @youngest_dob_Y = @pull_youngest.dob.strftime("%Y")
    @youngest_id = @pull_youngest.id
    render({:template => "directors_templates/youngest"})
  end

  def eldest 
    formatted_eldest = Director.where.not({:dob => nil }).order({:dob => :asc})
    @pull_oldest = formatted_eldest.at(0)
    @oldest_name = @pull_oldest.name 
    @oldest_dob_MD = @pull_oldest.dob.strftime("%B %e")
    @oldest_dob_Y = @pull_oldest.dob.strftime("%Y")
    @oldest_id = @pull_oldest.id
    render({:template => "directors_templates/oldest"})
  end
end

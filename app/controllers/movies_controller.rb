class MoviesController < ApplicationController
  def all_movies 
    render({ :template => "movies_templates/all_movies"})
  end

  def movie_details
    @movie_choice = params.fetch("movie_id").to_i
    @movie_more = Movie.where({ :id => @movie_choice}).at(0)
    
    
    render({ :template => "movies_templates/more_movies"})
  end
end

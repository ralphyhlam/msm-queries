Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  #Directors Section
  get("/directors", { :controller => "directors", :action => "all_directors"})

  get("/directors/:director_id", { :controller => "directors", :action => "learn_more"})

  #Movies Section
  get("/movies", {:controller => "movies", :action => "all_movies"})

  get("/movies/:movie_id", { :controller => "movies", :action => "movie_details"})

  #Actors Section 
  get("/actors", {:controller => "actors", :action => "all_actors"})

  get("/actors/:actor_id", {:controller => "actors", :action => "actor_details"})

end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/one_actor", controller: "actors", action: "one_actor"

  get "/all_movies" => "movies#all_movies"

  get "/one_movie/:id" => "movies#one_movie"
end

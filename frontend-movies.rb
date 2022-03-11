require "http"

response = HTTP.get("http://localhost:3000/all_movies.json")
movies = response.parse(:json)
pp movies

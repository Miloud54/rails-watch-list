require "open-uri"
require "json"

url = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=2&api_key=3f8808acd1af4a7ec81da866ac3a411f"
movie_list = URI.open(url).read
movies = JSON.parse(movie_list)["results"]

puts "Creating movies"

movies.each do |movie|
  Movie.create(
    title: movie["original_title"],
    overview: movie["overview"],
    poster_url: "https://image.tmdb.org/t/p/original#{movie["backdrop_path"]}",
    rating: movie["vote_average"].round(1))
end

puts "#{Movie.count} movies created!"

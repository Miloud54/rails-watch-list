require "open-uri"
require "json"

Movie.destroy_all

url = 'https://tmdb.lewagon.com/movie/top_rated'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)['results']

movies.each do |movie|

  image_url = "https://image.tmdb.org/t/p/w500#{movie['poster_path']}"

  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: image_url,
    rating: movie['vote_average']
  )
end

puts "#{Movie.count} movies created!"

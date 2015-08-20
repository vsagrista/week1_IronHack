
require "Imdb"

class GetMovies
attr_accessor :movies
	def initialize
		@movies = IO.readlines("movies.txt")
	end
	def send_movies_DB
		@movies.each do |movie|
			GetRatings.new.rating_push(movie)
		end
	end
end


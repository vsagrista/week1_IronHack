
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

class GetRatings
attr_accessor :movies_array
@@movies_array = []
@@i = 1
	def rating_push(movie)
		puts "#{@@i}.#{movie}"
		movie = Imdb::Search.new(movie)
		@rating =  movie.movies[0].rating.round
		@@movies_array << @rating
		@@i += 1
	end	
	def call_print_ratings
		PrintRatings.new.print_value(@@movies_array)
	end
end


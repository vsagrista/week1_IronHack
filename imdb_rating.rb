
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

class PrintRatings
	def initialize
		@max_rating = 8
	end
	
	def print_value(movies)
		while @max_rating > 0
			print "|"	
			movies.each do |item|
			  if item >= @max_rating
			    print "#"
			    print "|"
			  else 
			  	print " "
			  	print "|"
			  end  
		  end	
		  print "\n"  
		  @max_rating -= 1
		end
	end	

end

new_collection = GetMovies.new
new_collection.send_movies_DB
GetRatings.new.call_print_ratings


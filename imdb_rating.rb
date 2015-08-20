
require "Imdb"


class Movie
	def rating(movie)
		movie = Imdb::Search.new(movie)
		@rating =  movie.movies[0].rating.round
		
	end
	def stars
		star = ("*" * @rating).split("")
		puts star
	end
end


star_trek = Movie.new
star_trek.rating("Star Trek")
star_trek.stars



class Print
	def initialize
		@max_rating = 8
		@array = [7,8,8,3,2,6,1]
	end
	def print_value
		while @max_rating > 0
			print "|"	
			@array.each do |item|
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

new_print = Print.new
new_print.print_value


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


#star_trek.show_title
class ParseSlides
	
	def initialize
		@slides = IO.readlines("slides.txt")
		@page = 0
		@auto = false
	end

end
class ParseSlides
	
	def initialize
		@slides = IO.readlines("slides.txt")
		@page = 0
		@auto = false
	end

	def get_input
		puts "Enter n / p. Typing auto will make it work automatically"
		direction = gets.chomp
		  case direction
		    when "n"
		  		@page += 2
		  	when "p"
		  		@page -= 2
		  	when "auto"
		  		auto_mode
		  end
		  if_undefined_page
	end

	def manual_or_auto
		if @auto == true 
			sleep(3)  
			auto_mode
		else 
			get_input
		end
	end

end
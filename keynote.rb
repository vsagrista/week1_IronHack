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
		  fixes_undefined_input
	end

	def manual_or_auto
		if @auto == true 
			sleep(3)  
			auto_mode
		else 
			get_input
		end
	end



	def fixes_undefined_input 
		if @page == 6
		  @page = 0
		elsif @page == -2
		  @page = 2
		end
		count_spaces
	end	

end
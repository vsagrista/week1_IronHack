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

	def auto_mode
		@auto = true
			while true do
			  next_slide_auto_mode
			end
	end

	def next_slide_auto_mode
		@page += 2
		fixes_undefined_input
	end

	def count_spaces
		@lines = TermInfo.screen_size[0]
		@spaces = TermInfo.screen_size[1]
		@times_break = (@lines -2)/2
		@times_space = (@spaces - @slides[0].length) / 2 
		print_page
	end

	def print_page
		puts "\n" * @times_break
		print " " * @times_space
		puts @slides[@page]	
		print " " * @times_space
		print_type_of_mode
		puts "\n" * (@times_break - 1)
		puts "< PREVIOUS"
		print " " * (@spaces - "NEXT >".length)
		puts "NEXT >"
		manual_or_auto
	end

	def print_type_of_mode
		if @auto == true
			puts "-Auto mode on-"
		else
			puts ">"
		end
	end
end
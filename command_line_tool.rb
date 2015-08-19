
class CommandLine
	attr_accessor :input_user_name, :input_password
	attr_accessor :user_text
	
	def initialize
	  @user_name = "victor"
	  @password = "password"
	end
	
	def get_user_info
	  puts "Please, enter your user name:"
	    @input_user_name = gets.chomp
	  puts "Please, enter your password"
	    @input_password = gets.chomp
	end

	def enters_text
		if @input_user_name == @user_name && @input_password == @password
			puts "Please write something"
			@user_text = gets.chomp
	    else
	    	puts "Sorry, you introduced an incorrect user name or password \n"
	    	get_user_info
	    	choose_what?
	    end
	end
	def count_words
		puts @user_text.split.size
	end

	def count_letters
		puts @user_text.split.join.length	
	end

	def reverse_letters
		puts @user_text.reverse
	end

	def to_upcase
		puts @user_text.upcase 
	end

	def lower_case
		puts @user_text.downcase
	end

end






command_line = CommandLine.new
command_line.get_user_info
command_line.enters_text
command_line.choose_what?


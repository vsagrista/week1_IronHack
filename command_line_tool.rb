
class CommandLine
	attr_accessor :input_user_name, :input_password
	attr_accessor :user_text
	
	def initialize
	  puts ">"
	  @user_name = "victor"
	  @password = "password"
	end
	
	def get_user_info
	  puts "Please, enter your user name:"
	    @input_user_name = gets.chomp
	  puts "Please, enter your password"
	    @input_password = gets.chomp
	end
	
	def is_correct?
	  if @input_user_name == @user_name && @input_password == @password
		true 
	  else
		false
	  end
	end

	def enters_text
		if is_correct? == true
			puts "Please write something"
			@user_text = gets.chomp
		end
	end
	def count_words
		puts @user_text.length
	end

end


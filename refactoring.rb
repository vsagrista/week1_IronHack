class User 
	attr_accessor  :name, :email
	def initialize(name, email)
		@name = name
		@email = email
	end
end

class Token
	attr_accessor :user, :value, :expiration
	def initialize(user,value, expiration)
		@user = user
		@value = value
		@expiration =expiration	
	end
end

class Validator

	def initialize(user)
		@user = user
	end

	def token_value
		@value = 123456   
	end
 	
	def is_valid? (expiration, token)
		if Date.today < expiration && token == token_value
		puts "Authentification worked, welcome to our page!"
		end
	end

end
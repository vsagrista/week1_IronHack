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
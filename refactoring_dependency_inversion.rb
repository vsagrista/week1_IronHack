class Car 
  attr_accessor :speed
  def initialize(speed)
  	@speed = speed
  end
end

class Database
	def store_car(car)
	  DB.sql("INSERT INTO Cars VALUES #{car.speed}")
	end
end

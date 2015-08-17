
class Car 
  @@number_of_cars = IO.read("count_cars.txt").to_i
  attr_accessor :noise
  def initialize(other_noise)
  	 @noise = other_noise # instance variable
     @@number_of_cars += 1  # class variable
  	 IO.write("count_cars.txt", @@number_of_cars) 
  end
  def make_noise 
     puts @noise  
  end
  def self.number_of_cars    # Class method
  	 @@number_of_cars # we print how many objects there are
  end
end


class RaicingCar < Car
  def make_noise
    puts "BROOOOOM"
  end
end


honda = Car.new("BROOOOOM")   #instances
opel = Car.new("Broom")
ford = Car.new("Bang!")


honda.make_noise
opel.make_noise
ford.make_noise


raicing_car = RaicingCar.new("Bang Bang!")
raicing_car.make_noise

puts Car.number_of_cars # uses the self method, *this is another way to print it!


class Person
  attr_reader :name
  attr_reader :age
  attr_writer :age 
  
  def initialize(name, age) 
    @name = name
    @age = age
  end
end

pepe = Person.new("Pepe",20)
puts pepe.name
puts pepe.age
pepe.age = 30 #this overwites
puts pepe.age


array = [honda,opel,ford]
array.each do |item|
  item.make_noise
end



sounds = ["Broom", "Meek", "Nyan"]


array = sounds.map do |item|
          Car.new(item)
        end

array = sounds.map {|item| Car.new(item)}
    

print array


# EACH WITH OBJECT

dict = sounds.each_with_object({}) do |sound,object|
  object[sound] = Car.new(sound)
end
print  dict

# REDUCE

cars = [honda,opel,ford]
concat = cars.reduce("") {|sum,x| sum + x.noise}   # more efficient, this invokes .noise, we need the attr accessor!!!
puts concat

# Another example

[12, 45, 45].reduce {|sum,x| sum +x}


   
  




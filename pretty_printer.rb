require "date"
a_hash = {key: "value", other_key: "other_value"}
a_date = Date.today



class PrettyPrinter
@@counter = 1 # Counter to know about spacing (every time a new array, 2 more spaces of indentation)
  
  def initialize(object)
	@object = object # Send from here to the first_call method
  end
  
  def first_call
    object_is_array(@object)
  end
  
  def print_space 
    print "  "
  end

  def hash(hash) 
    @@counter.times{print_space}
    puts "Hash:"                                                                                                                              
    hash.each do |key,value|                                                                                                                       
    string = "#{key} -> #{value}"
    @@counter.times{print_space}
    @@counter.times{print_space}
    puts string                                                                                                                     
    end
  end
  
  def string(string)
    @@counter.times{print_space}
    puts string
  end
  
  def fixnum(fixnum)
    @@counter.times{print_space}
    puts fixnum
  end
  
  def date(date)
    @@counter.times{print_space}
    puts date
  end
  
  def print_items(object)
  	object.each do |item|
      if item.class == String
        string(item)
      elsif item.class == Fixnum
        fixnum(item)
      elsif item.class == Hash 
        hash(item)
      elsif item.class == Date 
        date(item) 
      elsif item.class == Array 
        @@counter+=1
        object_is_array(item)
      end
    end
  end

  def object_is_array(object)
    if @object.class == Array 
      if @@counter ==1
        puts "Array:"
        print_items(object)
      else
        (@@counter-1).times{print_space}
        puts "Array:"
        print_items(object)
      end
    else 
      puts "Array:"
      print_space
      print_space
      puts "An object I don't know how to print"
    end
  end
end


print = PrettyPrinter.new(["My", 3, a_hash, a_date, ["Pied", "Piper"]])
print.first_call


=begin
Output printed should be:
Array:
  My
  3
  Hash:
    key -> value
    other_key -> other_value
  12-07-2014
  Array:
    Pied
    Piper
=end










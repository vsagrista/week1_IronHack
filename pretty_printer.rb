
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

# Draft

require "date"
a_hash = {key: "value", other_key: "other_value"}
a_date = Date.today



class PrettyPrinter
  def initialize(object)
	@object = object
  end
  def printKey(hash)                                                                                                                               
    hash.each do |key,value|                                                                                                                       
    string = "#{key} -> #{value}"
    puts string                                                                                                                     
    end
  end
  def print_items
  	@object.each do |item|
      if item.class == String
        puts item
      elsif item.class == Fixnum
        puts item
      elsif item.class == Hash 
        puts item
      elsif item.class == Date 
        puts item
      elsif item.class == Array 
        call_again(item)
      end
    end
  end
  def call_again(item)
    @object = item
    print_items
  end

  def object_is_array
    if @object.class == Array 
      print_items
    else 
      puts "Array:"
      print "    "
      puts "An object I don't know how to print"

    end
  end



end


print = PrettyPrinter.new(["My", 3, a_hash, a_date, ["Pied", "Piper"]])
print.print_items





=begin
      case item
      when Array 
        puts "Array:"
        item.each do |x|
  	      recursive_process(x)
        end
      when String
        print "  "
        puts item
      when Fixnum
        print "  "
        puts item
      when Date
        print "  "
        puts item
      when is_a?Hash 
        printKey(item)
      end
    end
  end
end

=end
   


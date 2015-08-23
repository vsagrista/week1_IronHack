
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
  def hash(hash) 
    print "  "
    puts "Hash:"                                                                                                                              
    hash.each do |key,value|                                                                                                                       
    string = "#{key} -> #{value}"
    print "    "
    puts string                                                                                                                     
    end
  end
  def string(string)
    print "  "
    puts string
  end
  def fixnum(fixnum)
    print "  "
    puts fixnum
  end
  def date(date)
    print "  "
    puts date
  end
  def print_items
  	@object.each do |item|
      if item.class == String
        string(item)
      elsif item.class == Fixnum
        fixnum(item)
      elsif item.class == Hash 
        hash(item)
      elsif item.class == Date 
        date(item) 
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
      puts "Array:"
      print_items
    else 
      puts "Array:"
      print "    "
      puts "An object I don't know how to print"

    end
  end
end


print = PrettyPrinter.new(["My", 3, a_hash, a_date, ["Pied", "Piper"]])
print.object_is_array









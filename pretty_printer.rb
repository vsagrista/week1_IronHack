
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

PrettyPrinter.new.print_items(["My", 3, a_hash, a_date, ["Pied", "Piper"]])



class PrettyPrinter
  def initialize(object)
	@object = object
  end
  def printKey(hash)                                                                                                                               
    hash.each do |key,value|                                                                                                                       
    string = "#{key} -> #{value}"
    puts string                                                                                                                     
  end
  def print_items
  	@object.each do |item|
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
   


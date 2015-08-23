
class GetMoves

attr_accessor :coordenates
  def initialize
    @moves = IO.read("simple_moves.txt").split
    @coordenates = []
  end

  def create_one_string_moves
	@moves_to_string = ""
	@moves.each do |character|
	  @moves_to_string << character
	end
  end

  def send_characters_to_coordenates
	@moves_to_string.each_char do |point|
	  coordenates_generator(point)  
	end			
  end  

  def coordenates_generator(point)
    if point == "a"
	  @coordenates << 0
	elsif point == "b"
	  @coordenates << 1
	elsif point == "c"
	  @coordenates << 2
	elsif point == "d"
	  @coordenates << 3
	elsif point == "e"
	  @coordenates << 4
	elsif point == "f"
	  @coordenates << 5
	elsif point == "g"
	  @coordenates << 6 
	elsif point == "h"
	  @coordenates << 7
	else 
	  @coordenates << point.to_i
	end	
  end

  def convert_easier_format
  	@coordenates = @coordenates.each_slice(2).to_a
  end

end

new_coordenates = GetMoves.new
new_coordenates.create_one_string_moves
new_coordenates.send_characters_to_coordenates
new_coordenates.convert_easier_format



module OutOfBoard   # if true the rest is not executed
  def solution(array1,array2)
	if array1 != (0..8) || array2 != (0..8)
	  puts "Invalid"
	  return true
	end
  end
end

module IsEqual   # if true the rest is not executed
  def solution(array1,array2)
	if array1 == array2
	  puts "Invalid"
	  return true
	end
  end
end


module PawnMove 
  def solution(array1,array2) 
	if array1[0] == array2[0] 
	  if array2[1] == array1[1]+=1
		puts "Valid"
		  return true
	  end
	end
  end   
end

module QueenRookVerticalMoves  # Up & Down  
  def check_vertical_moves(array1,array2) 
	if array1[0] == array2[0] 
	  puts "Valid"
	  return true
	end
  end   
end


module QueenRookLateralMoves # Rook & Queen
  def check_lateral_moves(array1,array2) 
	if array1[1] == array2[1] 
	  if array1[0] != array2[0]
		puts "Valid"
		return true
      end
	end
  end   
end

module QueenBishopDiagonalMove # diagonal
  def initialize
	@queen_bishop_direction = ""
  end

  def check_diagonal_moves(array1,array2)
	if array2[0] < array1[0] && array2[1] > array1[1]
	  @queen_bishop_direction = "NW"
	elsif array2[0] > array1[0] && array2[1] > array1[1]
	  @queen_bishop_direction = "NE"
	elsif array2[0] > array1[0] && array2[1] < array1[1]
	  @queen_bishop_direction = "SE"
	elsif array2[0] < array1[0] && array2[1] > array1[1]
	  @queen_bishop_direction = "SW"
	end
	coordenates_calculator(array1,array2)
  end
	
  def coordenates_calculator(array1,array2)
    7.times do 
	  solution(array1[0],array2[0],array1[1],array2[1])
	  case @queen_bishop_direction
	  when "NW" 
	    array1[0]-=1
		array1[1]+=1
	  when "NE"
		array1[0]+=1
		array1[1]+=1
	  when "SE"
		array1[0]+=1
		array1[1]-=1
	  when "SW"
	    array1[0]-=1
		array1[1]-=1
	  end
	end
  end
  
  def solution(x,y,z,n)
	if x == y && z == n
	  puts "Valid"
	  return true
	end
  end
end

module KnightMove # L shape
  def initialize
    @knight_direction = ""
    @one_true = 0
  end
  def check_l_moves(array1,array2)
	if array2[0] > array1[0] && array2[1] > array1[1]
	  @knight_direction = "UpRight1"
	elsif array2[0] < array1[0] && array2[1] > array1[1]
	  @knight_direction = "UpRight2"
	elsif array2[0] > array1[0] && array2[1] < array1[1]
	  @knight_direction = "DownLeft1"
	elsif array2[0] < array1[0] && array2[1] < array1[1]
	  @knight_direction = "DownLeft2"
	end
	l_coordenates_calculator(array1,array2)
  end

  def l_coordenates_calculator(array1,array2)
    case @knight_direction
	when "UpRight1" 
	  array1[0]+=1
	  array1[1]+=2
	when "UpRight2"
	  array1[0]-=1
	  array1[1]+=2
	when "DownLeft1"
	  array1[0]+=1
	  array1[1]-=2
	when "DownLeft2"
	  array1[0]-=1
	  array1[1]-=2
	end
	one_valid_move?(array1[0],array2[0],array1[1],array2[1])	
  end

  def reverse_check(array1,array2) # x coordenate can be checked by reversing both coordenates 
	check_l_moves(array1.reverse,array2.reverse)
  end
	
  def one_valid_move?(x,y,z,n)
	if x == y && z == n
	  @one_true = 1
	  return true
	end 
  end

  def solution 
	if @one_true > 0
	  puts "Valid"
	  return true
	end
  end
end


module KingMove # king 
  def check_king_moves(array1,array2) # compare x with change in y	
	@both_coordenates_true = false
	  if array1[0] == array2[0]|| array1[0]+1 == array2[0]|| array1[0]- 1 == array2[0] && array1[1] == array2[1] || array1[1] + 1 == @yy || array1[1] - 1 == array2[1]
	    @both_coordenates_true = true
	  end
	solution
  end
  def solution
	if @both_coordenates_true == true
	  puts "Valid"
	  return true
	else 
	  puts "Invalid"
	end
  end
end


class Pawn
  def initialize
    puts "I'm a Pawn!"	
  end
  include PawnMove
end

class Rook
  def initialize
    puts "I'm a Rook!"	
  end
  include QueenRookVerticalMoves
end

class King
  def initialize
	puts "I'm a King!"	
  end
  include KingMove
end

class Knight
  def initialize
	puts "I'm a Knight!"	
  end
  include OutOfBoard
  include KnightMove
end

class Queen
  def initialize
	puts "I'm a Queen!"	
  end
  include QueenRookVerticalMoves     
  include QueenRookLateralMoves
  include QueenBishopDiagonalMove
end
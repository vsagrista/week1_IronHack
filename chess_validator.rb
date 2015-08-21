

class MoveUpDown  #[2,3],[2,4]
	def valid_y(array1,array2) # compare x with change in y
		if array1[0] == array2[0] 
			if array1[1] != array2[1]
				true
			else 
				false
			end	
		end
	end   
end


class MoveLeftRight < MoveUpDown
	def valid_x(array1,array2) # compare x with change in y
		if array1[1] == array2[1] 
			if array1[0] != array2[0]
				true
			else 
				false
			end	
		end
	end   
end


class MoveDiagonal
	def initialize
		@direction = ""
	end

	def which_direction(array1,array2)
		if array2[0] < array1[0] && array2[1] > array1[1]
			@direction = "NW"
		elsif array2[0] > array1[0] && array2[1] > array1[1]
			@direction = "NE"
		elsif array2[0] > array1[0] && array2[1] < array1[1]
			@direction = "SE"
		elsif array2[0] < array1[0] && array2[1] > array1[1]
			@direction = "SW"
		end
		coordenates_calculator(array1,array2)
	end
	
	def coordenates_calculator(array1,array2)
		8.times do 
			valid_diagonal?(array1[0],array2[0],array1[1],array2[1])
			case @direction
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
	def valid_diagonal?(x,y,z,n)
		if x == y && z == n
			puts "Valid"
			return true
		end
	end
end


new_move = MoveLeftRight.new
p new_move.valid_y([3,4],[5,3])
p new_move.valid_x([0,4],[3,4])


move = MoveDiagonal.new 
p move.which_direction([3,2],[4,1])


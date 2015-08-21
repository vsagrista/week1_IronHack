

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

new_move = MoveLeftRight.new
p new_move.valid_y([3,4],[5,3])
p new_move.valid_x([0,4],[3,4])
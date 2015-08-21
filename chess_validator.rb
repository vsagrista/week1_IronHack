

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
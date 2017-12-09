
class Board

	attr_accessor :grid

	def initialize
		@grid = []
		@column_index = { 'a'=> 0, 'b'=> 1, 'c'=> 2, 'd'=> 3, 'e'=> 4, 'f'=> 5, 'g'=> 6 }
		create_grid
	end	

	def create_grid
		7.times do 
			x = Array.new(6, ' ')
			@grid<<x 
		end
	end

	def draw_grid
		puts "\n"
		puts "  a  b  c  d  e  f  g  "
		x = 5
		6.times do 
		line = "||#{@grid[0][x]}||#{@grid[1][x]}||#{@grid[2][x]}||#{@grid[3][x]}||#{@grid[4][x]}||#{@grid[5][x]}||#{@grid[6][x]}||"
		puts line
		x -=1
		end
		puts ""
	end	

	def has_room(column)
		array_index = @column_index[column]
		if @grid[array_index][5] == ' '
			true
		else
			false
		end
	end

	def drop_piece(choice, player_mark)
		array_index = @column_index[choice]
		stopped = false
		x = 0
		until stopped
			if @grid[array_index][x] != ' '
				x += 1
			else	
				@grid[array_index][x] = player_mark
				stopped = true
			end
		end
	end

	def check_win
		if row_win || column_win || diagonal_win
			true
		else
			false
		end
	end

	def check_draw
		@board_full = true
		@grid.each do |x|
			if x.include?(' ')
				@board_full = false
			end
		end
		if @board_full == false || check_win
			false
		else
			true
		end
	end

	def row_win
		@win_in_row = false
		y = 0
			6.times do 
				row_string = ""
					@grid.each do |x|
					row_string<<x[y]
					end 
			if row_string.include?("xxxx") || row_string.include?("oooo")
				@win_in_row = true
			end
			y +=1
		end
			@win_in_row
	end

	def column_win
		@win_in_col = false
		@grid.each do |x|
			x_string = x.join
			if x_string.include?("xxxx") || x_string.include?("oooo")
				@win_in_col = true
			end		
		end
		@win_in_col
	end

	def diagonal_win
		@win_on_diag = false
	
		# the hashes contain the coordinates of the start of the diagonal lines then i iterate through each one
		# there are 6 down and 6 up diagonals that could contain a winning line and every one is checked in this method each time 
		# a piece is dropped
		up_diag_start_index = { 'a'=> [0,0], 'b'=>[0,1], 'c'=>[0,2], 'd'=>[1,0], 'e'=>[2,0], 'f'=>[3,0] }
		
		up_diag_start_index.each do |key, value|
			diag_string = ""
				x = value[0]
				y = value[1]
					until x > 6 || y > 5
						diag_string<<@grid[x][y]
							x += 1
							y += 1
					end		
						if diag_string.include?("xxxx") || diag_string.include?("oooo")
						@win_on_diag = true
					end
		end

		down_diag_start_index = { 'a'=>[0,3], 'b'=>[0,4], 'c'=>[0,5], 'd'=>[1,5], 'e'=>[2,5], 'f'=>[3,5] }

		down_diag_start_index.each do |key, value|
			diag_string = ""
			x = value[0]
			y = value[1]
				until x > 6 || y < 0 
					diag_string<<@grid[x][y]
						x += 1
						y -= 1
					end
						if diag_string.include?("xxxx") || diag_string.include?("oooo")
							@win_on_diag = true
					end
				end
		@win_on_diag
	end
	
end	

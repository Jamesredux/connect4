require 'spec_helper'


RSpec.describe 'Board' do 
	let(:board) { Board.new }

	it 'creates a Board class' do 
		expect(board).to be_instance_of(Board)
	end

	it 'will have grid array' do 
		expect(board.grid).to be_instance_of(Array)
	end

	it 'has is an array of 7 arrays' do
		expect(board.grid.size).to eq(7)
	end

	it 'has 7 arrays to represent 7 columns each size 6' do 
		expect(board.grid[3].size).to eq(6)
	end

	it 'is empty when initialized' do 
		expect(board.grid[3][5]).to eq(' ')
	end



end

describe 'input check' do 
	let(:board) { Board.new }

	it 'returns true if there is space in column' do
		expect(board.has_room('d')).to be true
	end

	it 'returns false if the column is full' do 
		board.grid[3] = ['x','x','x','o','o','x']
		expect(board.has_room('d')).to be false
	end

end

describe 'check_win' do 
	let(:board) { Board.new }
	context 'default' do 
	
		it 'returns false by default'  do 
		expect(board.check_win).to be false
		end
	end

	context 'columns' do 
		it 'returns true if there is a group of 4 in a column' do 
			board.grid[0] = ['o','x','x','x','x',' '] 
			expect(board.check_win).to be true
		end
	end

	context 'rows' do 
		
		it 'returns true if a row has 4 in a row' do 
			x = 1 
				4.times do 
				board.grid[x][1] = 'o'
				x += 1
				end
			expect(board.check_win).to be true
		end
	end

	context 'diagonals' do 
		it 'returns true if 4 in a row up to the right' do 
			x = 0
			y = 0
			4.times do 
				board.grid[x][y] = 'x'
				x += 1
				y += 1 
			end
			expect(board.check_win).to be true 
		end
	end


	context 'diagonals' do 
		it 'returns true if 4 in a row down to the right' do 
			x = 3
			y = 5
			4.times do 
				board.grid[x][y] = 'o'
				x += 1
				y -= 1 
			end
			expect(board.check_win).to be true 
		end
	end


end



describe 'column_win' do 
	let(:board) { Board.new }

		it 'returns false on empty board' do 
			expect(board.column_win).to be false
		end 

		it 'returns false on full board with no winner' do 
			x = 0
			col_a = ['x','x','o','o','x','x']
			col_b = ['o','o','x','x','o','o']
				7.times do 
					x.even? ? col = col_a : col = col_b
					board.grid[x] = col
					x += 1
				end
			expect(board.column_win).to be false
		end	

		it 'returns true with a column 4 in a row' do 
			4.times do 
				board.drop_piece('b', 'x')
			end
			expect(board.column_win).to be true
		end		

		it 'returns true with 4 in a row not from the bottom' do 
			board.drop_piece('b', 'x')
			4.times do 
				board.drop_piece('b', 'o')
			end
			board.drop_piece('b', 'x')
		expect(board.column_win).to be true
		end	
	end

describe 'row_win' do 
	let(:board) { Board.new }

		it 'returns false on empty board' do 
			expect(board.row_win).to be false
		end 

		it 'returns false on full board with no winner' do 
			x = 0
			col_a = ['x','x','o','o','x','x']
			col_b = ['o','o','x','x','o','o']
				7.times do 
					x.even? ? col = col_a : col = col_b
					board.grid[x] = col
					x += 1
				end
			expect(board.row_win).to be false
		end	

		it 'returns true with a row 4 in a row' do 
			x = 0 
			4.times do 
				board.grid[x][0] = 'x'
				x += 1
				end
						
			expect(board.row_win).to be true
		end		

		it 'returns true with 4 in a row not on the bottom' do 
			x = 0
			col_a = ['x','x','o','o','x','x']
			col_b = ['o','o','x','o','o','o']
				7.times do 
					x.even? ? col = col_a : col = col_b
					board.grid[x] = col
					x += 1
				end
		expect(board.row_win).to be true
		end	

end

describe 'diagonal_win' do 
	let(:board) { Board.new }

		it 'returns false on empty board' do 
			expect(board.diagonal_win).to be false
		end 

		it 'returns false on full board with no winner' do 
			x = 0
			col_a = ['x','x','o','o','x','x']
			col_b = ['o','o','x','x','o','o']
				7.times do 
					x.even? ? col = col_a : col = col_b
					board.grid[x] = col
					x += 1
				end
			expect(board.diagonal_win).to be false
		end	

		it 'returns true with a diag 4 down to the right' do 
			x = 3
			y = 5
			4.times do 
				board.grid[x][y] = 'o'
				x += 1
				y -= 1 
			end
			board.draw_grid
			expect(board.diagonal_win).to be true
		end		

		it 'returns true with 4 in a row up to the right' do 
			x = 0
			y = 0
			4.times do 
				board.grid[x][y] = 'x'
				x += 1
				y += 1 
			end
		
		
			board.draw_grid
		expect(board.diagonal_win).to be true
		end	

end

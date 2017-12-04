require_relative './board.rb'
require_relative './player.rb'


class Game
	def initialize
		@game_over = false
		choose_players
		@player_turn = @player_1
		@board = Board.new

	end

	def choose_players
		puts "Player 1, you will play as \'x\' what is your name"
		player_1_name = gets.chomp
		@player_1 = Player.new(player_1_name, 'x')
		puts "Player 2, you will play as \'o\' what is your name"
		player_2_name = gets.chomp
		@player_2 = Player.new(player_2_name, 'o')
	end

	def start_game
		until @game_over
			play_game
		end
	end

	def play_game
		@board.draw_grid
		puts "#{@player_turn.player_name} Please choose a square"
		choice = get_choice
		@board.drop_piece(choice, @player_turn.player_mark)
		winner if @board.check_win
		game_draw if @board.check_draw
		switch_player



	end

  def get_choice
  	column_choice = gets.chomp
  	if valid_column(column_choice) == false
  		puts "Please choose a column from a to g"
  		column_choice = get_choice
  	elsif @board.has_room(column_choice) == false
  		puts "That column is full, please choose another one."
  		column_choice = get_choice
  	end
  		column_choice
  end		

	def valid_column(choice)
		ok_letters = ['a','b','c','d','e','f','g']
		if ok_letters.include? choice
			true
		else
			false
		end
	end	

	def winner
		@game_over = true
		@board.draw_grid
		winner = @player_turn.player_name
		puts "Congratulations #{winner} you are the winner"	
		play_again
	end

	def game_draw
		@game_over = true
		puts "Stalemate -- The game is a draw"
		play_again
	end

	def play_again
		#method to give option to start a new game
	end


	def switch_player
		if @player_turn == @player_1
			@player_turn = @player_2
		else
			@player_turn = @player_1
		end
	end


end

game = Game.new
game.start_game
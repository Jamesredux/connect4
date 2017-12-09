class Player
	attr_accessor :player_name, :player_mark

		def initialize(player_name="Player 1", player_mark='x')
			@player_name = player_name
			@player_mark = player_mark
		end	
end	
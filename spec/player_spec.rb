require 'spec_helper'

describe 'player class' do 

	it 'defaults to player 1 and x' do 
		player = Player.new
	expect(player.player_name).to eq('Player 1')	
	expect(player.player_mark).to eq ('x')
	end

	it 'can create new players with new name and mark' do 
		new_player = Player.new('James', 'h')
		expect(new_player.player_name).to eq('James')
		expect(new_player.player_mark).to eq('h')
	end 


	end
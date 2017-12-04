require 'spec_helper'

RSpec.describe Game do
let(:game) { Game.new }	
	it 'is an instance of Game class' do 
		expect(game).to be_instance_of(Game)
	end

	it 'checks user choice of column' do 
		expect(game.valid_column('j')).to be false
	end

	it 'returns true for an ok choice' do 
		expect(game.valid_column('c')).to be true
	end

	
end
require 'tictactoe'

describe TicTacToe do

	let(:board) {TicTacToe::Board.new}

	describe "initialize board" do
		it "initializes an empty board" do
			expect(board).to be_a(Array)
		end
	end

	#initialize empty board

	#returns invalid location warning when guess > 9 or < 1 or not an integer

	#returns draw game after 9 guesses

	#checks that guessed spot is not already taken

	#checks guess is added to player.picked array

	#checks for win
end
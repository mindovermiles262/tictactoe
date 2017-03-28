require 'tictactoe'

describe TicTacToe do

	describe "draw game" do
		before (:context) { TicTacToe.class_variable_set :@@plays, 7 }

		context "after 7 plays" do
			it "returns false" do
				expect(TicTacToe::draw?).to eq(false)
			end
		end
	end

end

=begin comment
	#returns draw game after 9 guesses
	describe "draw game" do

		before (:suite) { TicTacToe.class_variable_set :@@plays, 9 }

		
		context "after 9 plays" do
			#it "returns true" do
				expect(TicTacToe::draw?).to eq(true) 
			end
		end
	end
=end
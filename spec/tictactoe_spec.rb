require 'tictactoe'

describe TicTacToe do
let (:game) { TicTacToe.new }

	describe "#draw" do
		context "after 7 plays" do
			it "returns false" do
				game.instance_variable_set :@plays, 7
				expect(game.draw?).to eq(false)
			end
		end

		context "after 9 plays" do
			it "returns true" do
				game.instance_variable_set :@plays, 9
				expect(game.draw?).to eq(true)
			end
		end
	end
end
require 'board'

describe 'board class' do

    let(:board) {Board.new}

    it "initializes as board class" do
        expect(Board.new).to be_instance_of(Board)
    end
    it "initializes an array [1..9]" do
        expect(board.board).to match_array((1..9).to_a)
    end

    context "checks guess location for avaliability" do
        it "returns false when location taken" do
            board.instance_variable_set("@board", ["O", 2, "X", 4, 5, 6, 7, 8, 9] )
            player = double(:name => "Player 4", :marker => "O", :picked => 0)
            expect(board.check(2, player)).to eq(false)
        end
        it "returns true when location available" do
            board.instance_variable_set("@board", ["O", 2, "X", 4, 5, 6, 7, 8, 9] )
            player = double(:name => "Player 4", :marker => "O", :picked => 0)
            expect(board.check(3, player)).to eq(true)
        end    
    end

    context "#win" do
        it "returns true 3 across top line" do
            player = double(:picked => [0,1,2])
            expect(board.win(player)).to eq(true)
        end

        it "returns true 3 across middle line" do
            player = double(:picked => [3,4,5])
            expect(board.win(player)).to eq(true)
        end

        it "returns true 3 across bottom line" do
            player = double(:picked => [6,7,8])
            expect(board.win(player)).to eq(true)
        end

        it "returns true 3 along left side" do
            player = double(:picked => [0,3,6])
            expect(board.win(player)).to eq(true)
        end

        it "returns true 3 up down middle" do
            player = double(:picked => [1,4,7])
            expect(board.win(player)).to eq(true)
        end

        it "returns true 3 along right side" do
            player = double(:picked => [2,5,8])
            expect(board.win(player)).to eq(true)
        end

        it "returns false when no win" do
            player = double(:picked => [1,4,9,8])
            expect(board.win(player)).not_to eq(true)
        end
    end

end
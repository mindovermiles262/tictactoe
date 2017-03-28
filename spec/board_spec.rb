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
            dbl = double("Double", :name => "Player 4", :marker => "O", :picked => 0)
            expect(board.check(2, dbl)).to eq(false)
        end
        it "returns true when location available" do
            board.instance_variable_set("@board", ["O", 2, "X", 4, 5, 6, 7, 8, 9] )
            dbl = double("Double", :name => "Player 4", :marker => "O", :picked => 0)
            expect(board.check(3, dbl)).to eq(true)
        end    
    end

end
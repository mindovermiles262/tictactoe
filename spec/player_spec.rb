require 'player'

describe 'player' do

    let (:person) { Player.new("Player 1", "x") }

    context 'initialize' do
        it "names the player" do
            expect(person.name).to eq("Player 1")
        end
        it "creates marker" do
            expect(person.marker).to eq("x")
        end
        it "initializes empty array" do
            expect(person.picked.length).to eq(0)
        end
    end
end
require 'player'

describe 'player' do

    let (:person) { Player.new("Foo Bar", "t") }

    context 'initialize' do
        it "names the player" do
            expect(person.name).to eq("Foo Bar")
        end
        it "creates marker" do
            expect(person.marker).to eq("t")
        end
        it "initializes empty array" do
            expect(person.picked.length).to eq(0)
        end
    end
end
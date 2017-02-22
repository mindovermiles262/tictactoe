class TicTacToe

    def initialize()
        @board = Board.new
        @player1 = Player.new
        @player2 = Player.new
    end
    
    class Player
        def initialize()
            @picked = []
        end

        def choose(loc)
            #od
        end
    end



    class Board
        attr_accessor :player

        def initialize()
            puts "\nA nice game of Tic-Tac-Toe (3-in-a-row!)"
            arr = (0..8).to_a
            drawBoard(arr)
        end

        def drawBoard(arr)
            #Search array for locations
            #replace with "X" or "O"
            topRow = arr[0..2]
            middleRow = arr[3..5]
            bottomRow = arr[6..8]
            print("\n" + topRow.join(" | ") + "\n")
            9.times { print "-"}
            puts("\n" + middleRow.join(" | ") + "\n")
            9.times { print "-"}
            print("\n" + bottomRow.join(" | ") + "\n\n")
        end

        def checkWin
            #do
        end


    end
end

game = TicTacToe.new
#start player 1
#loop
#   player choose
#   check spot not taken
#   check 3 in a row  
#   change player 
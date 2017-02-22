class TicTacToe

    def initialize()
        puts "A nice game of Tic-Tac-Toe (3-in-a-row!)\n"
        @board = Board.new
        @player1 = Player.new
        @player2 = Player.new
        @gameData = (0..8).to_a
        start()
    end

    def drawBoard(arr)
        # draws board in terminal
        topRow = arr[0..2]
        middleRow = arr[3..5]
        bottomRow = arr[6..8]
        print("\n" + topRow.join(" | ") + "\n")
        9.times { print "-"}
        print "     X: #{@player1[0]}"
        puts("\n" + middleRow.join(" | ") + "\n")
        9.times { print "-"}
        print "     O: #{@player2[0]}"
        print("\n" + bottomRow.join(" | ") + "\n\n")
    end

    def switchPlayer()
        # switches active player
        if @activePlayer[0] == @player1[0]
            @player1 = @activePlayer
            @activePlayer = @player2
        else
            @player2 = @activePlayer
            @activePlayer = @player1
        end
    end

    def start()
        # game introduction
=begin - uncomment for actual game
        print 'Player "X" - What is your name? '
        p1Name = gets.chomp.to_s
        print 'Player "O" - What is your name? '
        p2Name = gets.chomp.to_s
        @player1 = [p1Name, "X"]
        @player2 = [p2Name, "O"]
=end
        @player1 = ["Erik", "X"] #remove for actual game
        @player2 = ["Frank", "O"] #remove for actual game
        puts "Hi #{@player1[0]} and #{@player2[0]}! Let's play Tic-Tac-Toe!"
        #TODO: random player start
        @activePlayer = @player1
        drawBoard(@gameData)

        puts "#{@activePlayer[0]}, Choose location to place #{@activePlayer[1]}"
        choice = gets.chomp.to_i
        until (choice.is_a? Integer) && (choice.to_i >= 0) && (choice.to_i <= 8)
            puts "Invalid Location. Try again"
            choice = gets.chomp.to_i
        end
        run()
    end

    def run()
        # makes program run until 3 in a row
        puts "Active Player: #{@activePlayer[0]}"
        switchPlayer()
        puts "Active Player: #{@activePlayer[0]}"
    end
    

    class Player
        def initialize()
            @picked = []
        end

        def choose(loc)
            # function to choose marker location
            # check if spot has been taken already
            # change gameData array if free
        end


    end


    class Board
        attr_accessor :player

        def initialize()
            # do something
        end



        def checkWin
            # do something
        end
    end
end

game = TicTacToe.new
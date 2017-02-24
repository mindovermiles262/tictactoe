class TicTacToe
    def initialize
        @board = Board.new
        @player1 = Player.new
        @player2 = Player.new
        welcome(@player1, @player2)
    end
    def welcome(p1, p2)
        puts "Welcome #{p1.name} and #{p2.name}"
        Board.display(@board)
    end
end

class Player
    @@player_count = 0
    attr_reader :name, :marker
    def initialize
        puts "Player 1 what is your name?"
        @name = gets.chomp
        @@player_count += 1
        if @@player_count == 1
            @marker = "X"
        else
            @marker = "O"
        end
    end
end

class Board
    attr_reader :board, :print, :display
    def initialize
        @board = (0..8).to_a
    end

    def board
        @board
    end

    def display(board)
        puts "Board.display"
        top_row = board[0..2]
        #middle_row = board[3..5]
        #bottom_row = board[6..8]
        print("\n" + top_row.join(" | ") + "\n")
        9.times { print "-"}
        #puts("\n" + middle_row.join(" | ") + "\n")
        #9.times { print "-"}
        #print("\n" + bottom_row.join(" | ") + "\n\n")
    end
    def test
        puts "TESTING 1-2-3"
    end
end

game = TicTacToe.new
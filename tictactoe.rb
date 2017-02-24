class TicTacToe
    def initialize
        @board = Board.new
        @player1 = Player.new
        @player2 = Player.new
        @active_player = @player1
        welcome(@player1, @player2)
    end

    def welcome(p1, p2) # Welcome players to game
        puts "Welcome #{p1.name} and #{p2.name}!"
        choose(@active_player)
    end

    def choose(active_player) # @active_player chooses spot
        @board.display
        print "#{active_player.name}, Choose location to place #{active_player.marker}\n> "
        choice = gets.chomp.to_i - 1
        until (choice.is_a? Integer) && (choice.to_i >= 0) && (choice.to_i <= 8)
            puts "Invalid Location. Try again"
            choice = gets.chomp.to_i
        end
        @board.check(choice, active_player)
        @board.display
    end
end

class Player
    @@player_count = 0
    attr_reader :name, :marker
    def initialize
        puts "Player #{@@player_count + 1} what is your name?"
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
    attr_reader :board

    def initialize
        @board = (1..9).to_a
    end

    def display
        puts "Board.display"
        top_row = board[0..2]
        middle_row = board[3..5]
        bottom_row = board[6..8]
        puts "\n" + top_row.join(" | ") + "\n"
        9.times { print "-" }
        puts "\n" + middle_row.join(" | ") + "\n"
        9.times { print "-"}
        puts "\n" + bottom_row.join(" | ") + "\n\n"
    end

    def check(pick, player)
        puts "Board.check"
        if board[pick] == pick + 1
            board[pick] = player.marker
        else
            # Test this later!
            TicTacToe.choose(player)
        end

    end
end

game = TicTacToe.new
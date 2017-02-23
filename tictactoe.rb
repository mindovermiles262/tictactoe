class TicTacToe
    def initialize
        puts "A nice game of Tic-Tac-Toe (3-in-a-row!)\n"
        @board = Board.new
        @player1 = Player.new
        @player2 = Player.new
        @game_data = (0..8).to_a
        start()
    end

    def play(active)
        puts "#{active[0]}, Choose location to place #{active[1]}"
        choice = gets.chomp.to_i
        until (choice.is_a? Integer) && (choice.to_i >= 0) && (choice.to_i <= 8)
            puts "Invalid Location. Try again"
            choice = gets.chomp.to_i
        end
        # choose method (checks spot, places marker)
        # switch players
        Player.switch_player(@active_player, @player1, @player2)
    end

    def start
        # game introduction
=begin
uncomment for actual game
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
        @active_player = @player1
        Board.draw_board(@game_data)
        puts @active_player
        play(@active_player)
    end
end
    

class Player
    def initialize
        @picked = []
    end

    def self.switch_player(active, p1, p2)
        # switches active player
        puts "Active: #{active[0]}, P1 #{p1[0]}, P2 #{p2[0]}".inspect
        puts active==p1

        if active==p1
            p1 = active
            active = p2
        else
            p2 = active
            active = p1
        end
        puts "Active: #{active}"
        TicTacToe.play(active)
    end

    def choose(loc)
        # function to choose marker location
        # check if spot has been taken already
        # change gameData array if free
    end
end


class Board
    def initialize
        # do something
    end

    def self.draw_board(arr)
        # draws board in terminal
        top_row = arr[0..2]
        middle_row = arr[3..5]
        bottom_row = arr[6..8]
        print("\n" + top_row.join(" | ") + "\n")
        9.times { print "-"}
        puts("\n" + middle_row.join(" | ") + "\n")
        9.times { print "-"}
        print("\n" + bottom_row.join(" | ") + "\n\n")
    end

    def checkWin
        # do something
    end
end

game = TicTacToe.new
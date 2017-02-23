class TicTacToe
    def initialize
        puts "A nice game of Tic-Tac-Toe (3-in-a-row!)\n"
        @player1 = Player.new
        @player2 = Player.new
        @game_data = (0..8).to_a
        start()
    end

    def start
        # game introduction
=begin - Remove for actual game
        print 'Player "X" - What is your name? '
        p1Name = gets.chomp.to_s
        print 'Player "O" - What is your name? '
        p2Name = gets.chomp.to_s
        @player1 = [p1Name, "X"]
        @player2 = [p2Name, "O"]
=end

        @player1 = ["Erik", "X"]
        @player2 = ["Frank", "O"]
        puts "Hi #{@player1[0]} and #{@player2[0]}! Let's play Tic-Tac-Toe!"
        #TODO: random player start
        @active_player = @player1
        play(@active_player)
    end

    def play(active)
        print @game_data
        Board.draw_board(@game_data)
        puts "#{active[0]}, Choose location to place #{active[1]}"
        choice = gets.chomp.to_i
        until (choice.is_a? Integer) && (choice.to_i >= 0) && (choice.to_i <= 8)
            puts "Invalid Location. Try again"
            choice = gets.chomp.to_i
        end
        Player.new.choose(@game_data, choice, @active_player)
        # choose method (checks spot, places marker)
        # switch players
        Player.new.switch_player(@active_player, @player1, @player2)
    end
end
    

class Player
    def initialize
        @picked = []
    end

    def switch_player(active, p1, p2)
        # switches active player
        if active==p1
            p1 = active
            active = p2
        else
            p2 = active
            active = p1
        end
        TicTacToe.play(active)
    end

    def choose(data, choice, plyr)
        # function to choose marker location
        # check if spot has been taken already
        # change gameData array if free
        if data[choice] == choice
            data[choice] = plyr[1]
            puts data.inspect
        else #spot already picked

        end
        @game_data = data
        @game_data
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
class TicTacToe
    attr_reader :active_player
    def initialize
        @board = Board.new
        @player1 = Player.new
        @player2 = Player.new
        #TODO: Add Random Player Start
        @active_player = @player1
        welcome(@player1, @player2)
    end

    def welcome(p1, p2) # Welcome players to game
        puts "Welcome #{p1.name} and #{p2.name}!"
        choose(@active_player)
    end

    def choose (player) # @active_player chooses spot
        @board.display
        print "#{player.name}, Choose location to place #{player.marker}\n> "
        choice = gets.chomp.to_i - 1
        until (choice.is_a? Integer) && (choice.to_i >= 0) && (choice.to_i <= 8)
            puts "Invalid Location. Try again"
            choice = gets.chomp.to_i
        end
        player.picked.push(choice) # Move this after check
        puts "Picked: #{player.picked}"
        @board.check(choice, player)
    end
end

class Player
    attr_reader :name, :marker, :picked
    @@player_count = 0

    def initialize
        puts "Player #{@@player_count + 1} what is your name?"
        @name = gets.chomp
        @picked = [2,6] # CLEAR FOR REAL GAME!
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
        #@board = (1..9).to_a #UNCOMMENT LINE FOR REAL GAME!
        @board = [1,2,3,4,4,6,7,8,9]
    end

    def display # print board in grid format
        puts "Board.display" # CLEAR FOR REAL GAME!
        top_row = board[0..2]
        middle_row = board[3..5]
        bottom_row = board[6..8]
        puts "\n" + top_row.join(" | ") + "\n"
        9.times { print "-" }
        puts "\n" + middle_row.join(" | ") + "\n"
        9.times { print "-"}
        puts "\n" + bottom_row.join(" | ") + "\n\n"
    end

    def check (pick, player) # check picked spot for availability
        puts "Board.check" # CLEAR FOR REAL GAME!
        if board[pick] == pick + 1
            board[pick] = player.marker
        else
            # TODO: Test return to TicTacToe.choose
            puts "Location already taken"
            TicTacToe.choose(player)
        end
        self.display
        win(player)
    end

    def win (player) # check if player has won game
        puts "Board.win" # CLEAR FOR REAL GAME!
        wins = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,9],[0,4,8],[2,4,6]]
        wins.each do |w|
            temp = player.picked & w
            if temp.to_s.length == 9
                2.times { print "\n" }
                puts "~*~ CONGRATULATIONS #{player.name.upcase}! YOU WIN! ~*~"
                2.times { print "\n" }
                break
            end
        end
        #switch player
    end
end

game = TicTacToe.new
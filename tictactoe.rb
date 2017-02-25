class TicTacToe
    attr_reader :active_player
    @@plays = 0

    def initialize
        @board = Board.new
        @player1 = Player.new
        @player2 = Player.new
        #TODO: Add Random Player Start
        @active_player = @player1
        welcome(@player1, @player2, @active_player)
    end

    def welcome(p1, p2, player) # Welcome players to game
        puts "Welcome #{p1.name} and #{p2.name}!"
        @board.display
        puts "#{player.name}, Choose location to place #{player.marker}"
        choose(@active_player)
    end

    # @active_player chooses spot
    def choose (player)
        # check for draw
        if @@plays >= 9 
            puts "\n\n        DRAW!\n\n"
            play_again
        end
        print "> "
        choice = gets.chomp.to_i - 1
        until (choice.is_a? Integer) && (choice.to_i >= 0) && (choice.to_i <= 8)
            puts "Invalid Location. Try again"
            choice = gets.chomp.to_i
        end
        if (@board.check(choice, player)) == false  
            puts "Location Taken, Try Again"
            choose(player)
        else
            player.picked << choice
            @@plays += 1
        end
        # check for win
        if (@board.win(player)) == true 
            puts "\n\n     CONGRATULATIONS #{player.name.upcase}! YOU WIN!\n\n"
            play_again
        else
            switch(player)
        end
    end

    # switch active player
    def switch (player)
        if player == @player1
            @player1 = player
            @active_player = @player2
        else
            @player2 = player
            @active_player = @player1
        end
        @board.display
        puts "#{@active_player.name}, Choose location to place #{@active_player.marker}"
        choose(@active_player)
    end

    def play_again
        puts "Play again? (Y/N)"
        response = gets.chomp.downcase
        if response == "y" || response == "yes"
            @@plays = 0
            TicTacToe.new
        else
            puts "Exiting..."
            exit
        end
    end

end

class Player
    attr_reader :name, :marker, :picked
    @@player_count = 0

    def initialize
        puts "Player #{(@@player_count % 2) + 1} what is your name?"
        @name = gets.chomp.capitalize
        @picked = []
        @@player_count += 1
        (@@player_count % 2) == 1 ? @marker="X" : @marker="O"
    end
end

class Board
    attr_reader :board

    def initialize
        @board = (1..9).to_a
    end

    # print board in grid format
    def display
        top_row = board[0..2]
        middle_row = board[3..5]
        bottom_row = board[6..8]
        puts "\n" + top_row.join(" | ") + "\n"
        9.times { print "-" }
        puts "\n" + middle_row.join(" | ") + "\n"
        9.times { print "-"}
        puts "\n" + bottom_row.join(" | ") + "\n\n"
    end

    # check picked spot for availability
    def check (pick, player) 
        if board[pick] == pick + 1
            board[pick] = player.marker
            true
        else
            false
        end
    end

    # check if player has won game
    def win (player)
        wins = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,9],[0,4,8],[2,4,6]]
        wins.each do |w|
            temp = player.picked & w
            temp.to_s.length == 9 ? (return true) : false
        end
    end
end

game = TicTacToe.new
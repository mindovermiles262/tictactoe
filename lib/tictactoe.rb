class TicTacToe
    require_relative './board'
    require_relative './player'

    @@plays = 0

    def initialize
        @board = Board.new
        @player1 = Player.new("Player 1", "x")
        @player2 = Player.new("Player 2", "o")

        # Random starting player
        rand(1..2) == 1 ? @active_player = @player1 : @active_player = @player2
        
        game_start(@player1, @player2, @active_player)
    end

    # Welcome players to game
    def game_start(p1, p2, active) 
        puts "Welcome #{p1.name} and #{p2.name}!"
        @board.display
        puts "#{active.name}, You go first!"
        
        choose(@active_player)
    end

    # @active_player chooses spot
    def choose (player)
        if draw? == false
            puts "#{player.name} choose location to place #{player.marker}"
            print "> "
            choice = gets.chomp.to_i - 1
            until (choice.is_a? Integer) && (choice.to_i >= 0) && (choice.to_i <= 8)
                puts "Invalid Input. Try again"
                choice = gets.chomp.to_i
            end
            check_spot(choice, player)
        else
            puts "\n\n        DRAW!\n\n"
            play_again
        end
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

    def draw?
        if @@plays >= 9 
            true
        else
            false
        end
    end

    def win?(player)
        if (@board.win(player)) == true 
            puts "\n\n     CONGRATULATIONS #{player.name.upcase}! YOU WIN!\n\n"
            play_again
        else
            switch(player)
        end
    end

    def check_spot(choice, player)
        if (@board.check(choice, player)) == false  
            puts "Location Taken, Try Again"
            choose(player)
        else
            player.picked << choice
            @@plays += 1
        end
        win?(player)
    end

    def switch (player)
        if player == @player1
            @player1 = player
            @active_player = @player2
        else
            @player2 = player
            @active_player = @player1
        end
        @board.display
        choose(@active_player)
    end
end


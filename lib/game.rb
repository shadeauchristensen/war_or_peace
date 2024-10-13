class Game
    attr_reader :player1, :player2, :turn_count
  
    def initialize(player1, player2)
      @player1 = player1
      @player2 = player2
      @turn_count = 0
    end
  
    def start #This defines a new method called start
      puts "Welcome to War! (or Peace) This game will be played with 52 cards."
      puts "The players are #{player1.name} and #{player2.name}. Good luck!"
      puts "Type 'GO' to start!"
      input = gets.chomp.upcase # this will insure that whatever version 
      # of "go" is typed, that it'll be capitalized.
  
      if input == 'GO' # looking for command "GO"
        game_loop
      else
        puts "Invalid input. Type 'GO' to start the game."
      end
    end
  
    def game_loop # method to use if game requires turns below itll stop at 1 million turns
      while !player1.has_lost? && !player2.has_lost? #this line is asking that as long 
        #as player1 has not lost and player2 has not lost, to keep looping.
        turn = Turn.new(player1, player2) #representing 1 turn
        turn_type = turn.type_of_turn
  
        @turn_count += 1
        # I need to keep track of how many turns have passed
        turn_description = turn_type.to_s
        puts "Turn #{turn_count}: #{turn_description} Turn"
        #This prints out the turn number and the type of turn in a readable format. 
        #For example: "Turn 252: Basic Turn” or “Turn 10002: War Turn”
  
        winner = turn.winner # checking for winner
        if winner.nil?
          puts "No Winner"
        else
          puts "#{winner.name} has won the turn"
        end
  
        turn.pile_cards # piling caards and either giving them to the winner, or discarding them
        turn.award_spoils(winner) if winner
  
        if turn_count == 1_000_000 # a safeguard to prevent the game from running forever
          puts "---- DRAW ----"
          break
        end
      end
  
    end_game
  end
  
    def end_game # finally
      if player1.has_lost?# Making it sparkly!! remember the unicorn.rb test? its that same thing
        puts "*~*~* #{player2.name} has won the game! *~*~*"
      elsif player2.has_lost?# Making it sparkly!! remember the unicorn.rb test? its that same thing
        puts "*~*~* #{player1.name} has won the game! *~*~*"
      else
        puts "---- It's a DRAW! ----"
      end
    end
end
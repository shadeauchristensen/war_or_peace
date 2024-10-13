require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'
require './lib/turn'
require './lib/game'

    # First, I create the deck of cards by defining 2 arrays and 
    # initializing an empty array that can be populated by using an 
    # empty array for the cards class. (!dont use plurals in arrays!)
suits = [:heart, :diamond, :spade, :club]
ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
cards = []

suits.each do |suit| # starts a loop over the suits array
    ranks.each_with_index do |rank, index|
        # starts another loop over the ranks array
      cards << Card.new(suit, rank, index + 2)
      # The 'index + 2' represents the rank 
      # w/o adding +2 to the index, the rank would start from 0 instead of 2 (lowest card)
      # Object created using Card.new & Card object is added to the cards array
    end
end

# here I am shuffling the deck (found I need to shuffle cards instead)
shuffled_deck = cards.shuffle

# here I am shuffling and splitting the deck between 2 players

# I split the deck into two halves and give each player a deck
half = shuffled_deck.length / 2
    # deck has 52 cards, divided by 2 equals 26 per player
deck1 = Deck.new(shuffled_deck[0...half])
    # creates first half of deck ^^^^ & second half vvvv
deck2 = Deck.new(shuffled_deck[half..-1]) # (-1 represents the last index in Ruby).
    # The difference between '...' and '..' in Ruby is important when working with ranges, 
    # they control whether the endpoint is inclusive or exclusive
    # 0...half (exclusive) vs. half..-1 (inclusive)

# we create the players that are playing and what deck they are using
player1 = Player.new('Megan', deck1)
player2 = Player.new('Aurora', deck2)
game = Game.new(player1, player2)
game.start  # This starts the game loop

# Now I start the game loop counting turns and winner/loser
turn_count = 0 # starts at 0 (obvious reason)

# game continues while both players haven't lost
while !player1.has_lost? && !player2.has_lost? # ! is used to check whether the player has 
    # lost, which would stop the game immediately if either player has lost from 
    # the start, which is not what we want.
    turn = Turn.new(player1, player2)
    turn_type = turn.type_of_turn
    # I am asking the runner file to check the results of who won the round and 
    # to loop into another hand

    # I create a statement to declare the winner of the hand
    turn_count += 1
    turn_description = turn_type.to_s.capitalize
    puts "Turn number #{turn_count}: #{turn_description} Turn"
    # .to_s converts object into string 
    # converts :basic to "basic" so it can be capitalized and printed inside the string.
    
    winner = turn.winner # the winner of the turn,
    
    if winner.nil?
        puts "No Winner"
    else
        puts "#{winner.name} has won the turn"
    end
    
      # piles the cards and awards spoils if there is a winner
    turn.pile_cards
    turn.award_spoils(winner) if winner
    
      # Check for 1 million turns limit inside the loop
    if turn_count == 1_000_000
        puts "---- DRAW ----"
        break
    end
end
    
    # indicates who the winner is if there is a winner, otherwise will indicate a draw
if player1.has_lost?
      puts "#{player2.name} has won the game! Better luck next time #{player1.name}..."
elsif player2.has_lost?
      puts "#{player1.name} has won the game! Better luck next time #{player2.name}..."
else
      puts "It's a DRAW, try again?"
end

require 'rspec'
require './lib/card.rb'
require './lib/deck.rb'
require './lib/player.rb'
require './lib/turn.rb'

RSpec.describe Turn do
    #this time you forgot to to 'describe/it' your statements 
    # remember that i need to define whats happening in the game 
    #which will most likely result in a decribe,do and it,do
    #    vvvvvvvvvvvv
    describe "players turn" do
        it "creates a turn between two players" do
# Creating a pile of cards
        card1 = Card.new(:heart, 'Jack', 11)
        card2 = Card.new(:heart, '10', 10)
        card3 = Card.new(:heart, '9', 9) 
        card4 = Card.new(:diamond, 'Jack', 11)    
        card5 = Card.new(:heart, '8', 8)   
        card6 = Card.new(:diamond, 'Queen', 12)
        card7 = Card.new(:heart, '3', 3)
        card8 = Card.new(:diamond, '2', 2) 
    # Creating the decks of cards
        deck1 = Deck.new([card1, card2, card5, card8])  
        deck2 = Deck.new([card3, card4, card6, card7])
    #creating players
        player1 = Player.new("Megan", deck1)
        player2 = Player.new("Aurora", deck2)
    # creating a turn, Ive also added 'turn =' in order to pull "Turn"
        # into my expect statements
        turn = Turn.new(player1, player2)
        # as shown here      ----->      vvvvvv
        expect(turn).to be_an_instance_of(Turn)
        # remember to call names as strings! this took 30 minutes to realize
        expect(turn.player1.name).to eq("Megan")
        expect(turn.player2.name).to eq("Aurora")
        end
    end

    describe "type_of_turn" do
        it "determine the type_of_turn" do
            card1 = Card.new(:heart, 'Jack', 11)
            card2 = Card.new(:heart, '10', 10)
            card3 = Card.new(:heart, '9', 9) 
            card4 = Card.new(:diamond, 'Jack', 11)    
            card5 = Card.new(:heart, '8', 8)   
            card6 = Card.new(:diamond, 'Queen', 12)
            card7 = Card.new(:heart, '3', 3)
            card8 = Card.new(:diamond, '2', 2) 
        # Creating the decks of cards
            deck1 = Deck.new([card1, card2, card5, card8])  
            deck2 = Deck.new([card3, card4, card6, card7])
        #creating players
            player1 = Player.new("Megan", deck1)
            player2 = Player.new("Aurora", deck2)
        # creating a turn, Ive also added (again) 'turn =' in order 
        # to pull "Turn" into my expect statements
            turn = Turn.new(player1, player2)
            # as shown below  -----
            # using this to test the type of turn
            # ---- vvvv
            expect(turn.type_of_turn).to eq(:basic)
            # The (:basic) symbol is used for comparison, 
            # NOT the variable basic (remember this)
        end
    end
end



require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Deck do
    it "calculates the percentage of high-ranking cards" do
        #label to identify what the test is supposed to check
        card1 = Card.new('Hearts', 'Queen', 12)
        card2 = Card.new('Spades', '6', 3)
        card3 = Card.new('Clubs', 'Ace', 14)
            #three instances of a Card class, each representing a- 
            #-card with a suit, value, and rank
        cards = [card1, card2, card3]
        #This puts the three card objects into an array
        deck = Deck.new(cards) #creates new deck
            #creates a new Deck object and passes the cards array into it.
        expect(deck.percent_high_ranking).to eq(66.67)
        #checks that the percent_high_ranking method of the cards returns 66.67
        # (percentage of high-ranking cards)
    end
end
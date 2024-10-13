require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  it 'creates a player with a name and deck' do
    # don't forget that every it statement needs a do at the end
    # you messed this ^^^ up so hard, don't forget
    # Creating 3 cards + introducing Player
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)  

    deck = Deck.new([card1, card2, card3]) 
    player = Player.new('Clarisa', deck) 

    expect(player.name).to eq('Clarisa')
    expect(player.deck).to be_a(Deck)
  end

  # establishing player and their hand ^^^
  # and checking to see if player lost/won vvv
  it 'determines if a player has lost' do
    # Creating 3 cards + introducing Player
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3) 
    card3 = Card.new(:heart, 'Ace', 14)  

    deck = Deck.new([card1, card2, card3]) 
    player = Player.new('Clarisa', deck) 

    # the player has not lost since they have cards
    expect(player.has_lost?).to eq(false)
    
    # this removes 1 card and checks if person has lost
    player.deck.remove_card
    expect(player.has_lost?).to eq(false)
    
    player.deck.remove_card
    expect(player.has_lost?).to eq(false)
    
    player.deck.remove_card
    expect(player.has_lost?).to eq(true)
    
    # player is considered to have lost. The expectation checks 
    # that has_lost? returns true ^^^ since the deck is 
    # empty
    expect(player.deck.cards).to eq([])
    # confirms that all cards have, in fact, been removed
  end
end
class Deck
  attr_reader :cards

  def initialize(cards)
    # This sets up the Deck with an array of Card objects.
    @cards = cards
    # hold an array of Card objects 
  end

  def rank_of_card_at(index)
    return 0 if @cards[index].nil?
    #  # to return 0 if there is no card at the given index to avoid errors.
    # The rank of the card at a given position in the deck.
    @cards[index].rank
  end

  def high_ranking_cards
    # method calculates how many cards have a rank of 11 or higher.
    # filter out cards with ranks greater than or equal to 11 from the @cards array.
    @cards.select { |card| card.rank >= 11 }
  end

  def percent_high_ranking
    # Counts the number of high-ranking cards and gets the total 
    # number of cards using @cards.length.

    # Calculates the percentage by dividing the count of high-ranking cards by the total number of 
    # cards, multiplying by 100, and rounding to two decimal places.
    high_ranking_count = high_ranking_cards.length
    total_cards = @cards.length

    return 0 if total_cards == 0 # Returns 0 if the deck is empty to avoid dividing by zero.
    
    # Here we are calculating the percentage of high-ranking cards
    (high_ranking_count.to_f / total_cards * 100).round(2)
    # .to_f: This method converts high_ranking_count from an integer into whats known as a "floating-point number"
    # to a float using .to_f ensures the division will give 0.3333 instead of 0.
  end

  def remove_card
    # removes the first element from the @cards array, representing the top card.
    @cards.shift
  end

  def add_card(card)
    # Adds a new card to the bottom (end) of the deck.
    @cards.push(card)
  end
end
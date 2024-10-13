class Player
    attr_reader :name, :deck, :card
#initilizing the name and deck only, will only be checking if player lost
    def initialize (name, deck)
        @name = name
        @deck = deck
    end
    # adding to checck player lost
    def has_lost?
        @deck.cards.empty?
    end
end
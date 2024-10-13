class Card
    attr_reader :suit, :value, :rank #three points to assessing high cards
    def initialize(suit, value, rank)
        @suit = suit
        @value = value
        @rank = rank
        # as always make sure to @ initilize everthing when  starting
    end
end

class Turn
    attr_reader :player1, :player2, :spoils_of_war
    #initilizing the players. But turn is undefined. Remember to slow down.
    def initialize (player1, player2)
            @player1 = player1
            @player2 = player2
            @spoils_of_war = [] # an instance variable, @spoils_of_war, 
                                #to keep track of the cards that are added to the pile
    end

    def type_of_turn #figures out the rules for the current turn 
        # (i.e., how many cards are played and how the turn proceeds).
        if player1.deck.rank_of_card_at(0) != player2.deck.rank_of_card_at(0)
          :basic # the winner is the player with the higher top card & to check top cards are different
        elsif player1.deck.rank_of_card_at(0) == player2.deck.rank_of_card_at(0) &&
              player1.deck.rank_of_card_at(2) == player2.deck.rank_of_card_at(2)
          :mutually_assured_destruction # no winner, and both players lose their cards
        else
          :war #winner is the player with the higher third card.
        end
    end

    def winner #used to determine a winner (if there is one)
        if type_of_turn == :basic
            player1.deck.rank_of_card_at(0) > player2.deck.rank_of_card_at(0) ? player1 : player2
        elsif type_of_turn == :war
            player1.deck.rank_of_card_at(2) > player2.deck.rank_of_card_at(2) ? player1 : player2
        else
            nil  # No winner in mutually assured distruction
        end
    end

    def pile_cards # collecting cards from players for S.O.W array or M.A.D
        if type_of_turn == :basic # remove one card
          @spoils_of_war << player1.deck.remove_card # adding to S.O.W
          @spoils_of_war << player2.deck.remove_card # ^^^^^^^^^^^^^^
        elsif type_of_turn == :war # removing 3 cards from players deck and adds to S.O.W
          3.times do # <----- 3x card ---- vvvv ---- runs loop 3x
            @spoils_of_war << player1.deck.remove_card
            @spoils_of_war << player2.deck.remove_card
          end
        elsif type_of_turn == :mutually_assured_destruction
            # removes three cards from each player’s 
            # deck, but does not add them to the spoils.
            3.times do #  <----- 3x card ---- vvvv ---- runs loop 3x
                player1.deck.remove_card
                player2.deck.remove_card  
            # by this point itll discard the cards, no one wins
          end
        end
    end
      # now we have determined the winner and the "spoils" or rewards
    def award_spoils(winner)
        @spoils_of_war.each do |card| # loops through each card in the @spoils_of_war array
            winner.deck.add_card(card)
        end
        @spoils_of_war.clear # cards have been added to the winner’s deck
        # used .clear to empty array preventing any cards from being left over
    end
end
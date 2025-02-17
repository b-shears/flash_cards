
class Round
  attr_reader :deck, :turns, :number_correct
  #Initializes the round object and passes an arguement deck.
  def initialize(deck)
    @deck = deck
    @turns = []
    @number_correct = 0


  end


  def current_card

   deck.cards.first

  end

  def take_turn(guess)

      turn = Turn.new(guess, current_card)
        @turns << turn
        if guess == current_card.answer
            @number_correct += 1
        end
        deck.cards.rotate!
            #may require tinkering in iteration_3
        return turn

  end



  def number_correct_by_category(category)

    correct_turns = turns.select do |turn|


      turn.card.category == category && turn.correct?

    end

    correct_turns.count

  end

  def percent_correct

   (number_correct.to_f/(turns.count.to_f)) * 100

  end



  def percent_correct_by_category(category)

    percent_correct_cat = 0.0

      turns.each do |turn|
        if turn.card.category == category
          percent_correct_cat += 1.0
        end
      end

      (number_correct_by_category(category)/(percent_correct_cat)) * 100
    end

# number_correct_by_category(category)


  def start
    puts "Welcome! You're playing with #{deck.count} cards."
    puts "-" * 42

    card_x = 1
    while card_x <= deck.count

      puts "This is card number #{card_x} out of #{deck.count}."
      puts "Question: #{current_card.question}"
      guess = gets.chomp
      new_guess = take_turn(guess)
      puts new_guess.feedback

      card_x += 1

    end
  end












end

      #
      # number_turns = turns.select do |turn|
      #
      #   current_card(category) == category &&
      # end
      # # turns.select {|turn| current_card(category) == category}
      #
      # require "pry"; binding.pry
      # (number_correct_by_category(category)/()) * 100





  # if current_card(category) == category
  #         @number_correct += 1
    #select retuns an array by default [] when nothing is in the block

require "byebug"

class AI_Player
  attr_accessor :matched_cards

  def initialize(name)
    @name = name
    @stored_cards = Hash.new
    @matched_cards = Hash.new() { |h, k| h[k] = [] }
    @completed_matches = []
    @previous_play = nil
  end

  def get_play
    if @previous_play == nil
      value = guess
      @previous_play = value
      value
    else
      value = second_guess
      @previous_play = nil
      value
    end
  end

  def stored_card(move, val)
    @stored_cards[move] = val
  end

  def store_match
    @stored_cards.each do |k,v|
      if @matched_cards[v] == nil
        @matched_cards[v] = Array.new(k)
      elsif @matched_cards[v].include?(k) != true
        @matched_cards[v] << k
      end
    end
  end

  def find_match(pos)
    result = nil
    @matched_cards.each {|k,v| result = v.dup if v.include?(pos) }

    if result != nil && result.length == 2
      result.delete(pos)
      result[0]
    else
      nil
    end
  end

  def guess
    matched_pos = @matched_cards.values.select { |el| el.length == 2 }
    matched_pos-= @completed_matches
    if matched_pos.length > 0
      new_pos = matched_pos.sample.sample
      new_pos
    else
      random_guess
    end
  end

  def second_guess
    if find_match(@previous_play) != nil
      value = find_match(@previous_play)
      @completed_matches << [value, @previous_play]
      value
    else
      random_guess
    end
  end

  def random_guess
    while true
      position  = [rand(4), rand(4)]
      if @stored_cards[position].nil? && @completed_matches.none? {|el| el.include?(position)}
        return position
      end
    end
  end





end

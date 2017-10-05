require_relative "Card.rb"
require_relative "Board.rb"
require_relative "Player.rb"
require_relative "Ai_Player.rb"


class Game
  attr_reader :board

  attr_accessor :prev_guess

  def initialize(player)
    @board = Board.new
    @prev_guess = nil
    @player = player
  end

  def play
    @board.populate

    until @board.won?
      move1 = @player.get_play
      value1 = card_revealer(move1)
      board.render
      @player.stored_card(move1,value1)
      @player.store_match
      @prev_guess = move1
      system("clear")
      move2 = @player.get_play
      value2 = card_revealer(move2)
      board.render
      card_match(move1, move2)
      @player.stored_card(move2,value2)
      @player.store_match
      @prev_guess = nil
      sleep(1)
      system("clear")
    end

    puts "CONGRATULATIONS"
  end


  def card_revealer(move)
    raise "INVALID MOVE" if move == nil

    board.reveal(move)


  end
  def card_match(move1,move2)
    if @board.reveal(move1) != @board.reveal(move2)
      @board.hide(move1)
      @board.hide(move2)
    end
  end

end


if __FILE__ == $PROGRAM_NAME
  player1 = AI_Player.new("Santa Claus")
  game = Game.new(player1)
  game.play
end

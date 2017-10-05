class Board

  def initialize
    @grid = Array.new(4) { Array.new(4) }
  end

  def populate
    i = 1
    8.times do
      2.times { random_pos(Card.new(i)) }
      i+= 1
    end
  end

  def random_pos(card)
    placed = false
    position  = [rand(4), rand(4)]

    until placed
      if @grid[position[0]][position[1]].nil?
        @grid[position[0]][position[1]] = card
        placed = true
      else
        position  = [rand(4), rand(4)]
      end
    end
  end


  def render
    i = 0
    while i < 4
      puts "************"
      j = 0
      while j < 4
        print "*" + card_interpreter(@grid[i][j]) + "*"
        j+= 1
      end
      puts ""
      i+= 1
    end
  end


  def card_interpreter(card)
    if card.up_or_down == :down
      "D"
    else
      card.face_value.to_s
    end
  end

  def won?
    flat_array = @grid.flatten
    flat_array.all? {|card| card.up_or_down == :up}
  end



  def reveal(pos)
    x = pos[0]
    y = pos[1]
    @grid[x][y].reveal
    @grid[x][y].face_value
  end

  def hide(pos)
    x = pos[0]
    y = pos[1]
    @grid[x][y].hide
  end


end

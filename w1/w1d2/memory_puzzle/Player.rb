class Player

  def initialize(name)
    @name = name
  end


# [x,y]

  def get_play
    puts "Enter an x coordinate: "
    x_play = gets.chomp
    puts "Enter a y coordinate: "
    y_play = gets.chomp
    [x_play.to_i, y_play.to_i]
  end


  def stored_card(x,y)
    #does nothing
  end

end

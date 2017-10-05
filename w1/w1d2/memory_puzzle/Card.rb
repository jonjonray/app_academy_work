class Card
  attr_reader :face_value
  attr_accessor :up_or_down, :pos

  def initialize(face_value)
    @face_value = face_value
    @up_or_down = :down
    @pos = nil
  end

  def display
    @face_value if @up_or_down == :up
  end

  def hide
    @up_or_down = :down
  end

  def reveal
    @up_or_down = :up
  end

  def ==(card)
    @face_value == card.face_value
  end

end

class Cell

  attr_accessor :position
  attr_accessor :column
  attr_accessor :row
  attr_accessor :square
  attr_accessor :value

  def initialize position=0, value=0
    @position = position
    @value = value
    @row = get_row_for position
    @column = get_column_for position
    @square = get_square_for position
  end

  def get_column_for position
    column = position % 9
    column = 9 if column == 0
    column
  end

  def get_row_for position
    row = position / 9
    row += 1 if position % 9 != 0
    row
  end

  def get_square_for position 
    ((@row-1)/3)*3 + ((@column-1)/3) + 1
  end

  def solved?
    return false if value == 0
    true
  end





end
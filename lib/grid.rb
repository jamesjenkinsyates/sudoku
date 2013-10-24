class Grid

  attr_accessor :cell_array

  def initialize
    value = 2
    @cell_array = []
    (1..81).each do |position| 
      @cell_array << Cell.new(position,value)
    end
  end

  def create_empty_board
    @cell_array.each do |cell| 
      cell.value = 0
    end
  end

  def populate_values_from puzzle
    @cell_array.each do |cell| 
      cell.value = value
    end
  end

  def solved?
    @cell_array.each{ |cell| return false if !cell.solved?}
    true
  end

  def print_grid 
    @cell_array.each do |cell| 
      p cell.value
    end
  end

end
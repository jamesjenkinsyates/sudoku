class Grid

  attr_accessor :cell_array

  def initialize puzzle
    @cell_array = []
    puzzle_array = puzzle.scan(/./)
    (1..81).each do |position| 
      @cell_array << Cell.new(position,value = puzzle_array.delete_at(0).to_i)
    end
    # populate_values_from puzzle
  end

  def create_empty_board
    @cell_array.each do |cell| 
      cell.value = 0
    end
  end

  # def populate_values_from puzzle
  #   puzzle_array = puzzle.scan(/./)
  #   @cell_array.each do |cell| 
  #     cell.value = puzzle_array.delete_at(0).to_i
  #   end
  # end

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
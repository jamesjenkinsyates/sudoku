class Grid

  attr_accessor :cell_array

  def initialize puzzle
    @cell_array = []
    puzzle_array = puzzle.scan(/./)
    # puzzle_array = puzzle_array.map { |s| s = nil if s.to_i == 0 }
    # puts puzzle_array
    (1..81).each do |position| 
      @cell_array << Cell.new(position,value = puzzle_array.delete_at(0).to_i)
    end
  end

  def create_empty_board
    @cell_array.each do |cell| 
      cell.value = 0
    end
  end

  def solved?
    @cell_array.each{ |cell| return false if !cell.solved?}
    true
  end

  def values_in_column_for selected_cell
    array = @cell_array.select { |cell| cell.column == selected_cell.column }
    array.map { |cell| cell.value if cell.value != 0 }.compact
  end

  def values_in_row_for selected_cell
    array = @cell_array.select { |cell| cell.row == selected_cell.row }
    array.map { |cell| cell.value if cell.value != 0 }.compact
  end

  def values_in_square_for selected_cell
    array = @cell_array.select { |cell| cell.square == selected_cell.square }
    array.map { |cell| cell.value if cell.value != 0 }.compact
  end

  def candidate_values selected_cell
    all_values = (1..9).to_a
    candidates = (all_values - values_in_square_for(selected_cell) - values_in_row_for(selected_cell) - values_in_column_for(selected_cell))
    return correct_answer(candidates)
  end

  def correct_answer candidates
    if candidates.count == 1
      answer = candidates.pop
      return answer
    else
      return nil
    end
  end

  def solve_puzzle
    while solved? != true
      @cell_array.each do |cell|
        print_grid
        if candidate_values(cell) != nil
          cell.value = candidate_values(cell)
        else
        end
     end
    end
  end














  def print_grid 
    puts "-----------grid------------"
    (1..9).each do |row|
      row = @cell_array.select {|cell| cell.row == row }
      p row.map { |cell| cell.value }
    end
  end



end
require 'grid'
require 'cell'

describe Grid do
  
  let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600' }
  let(:grid) { Grid.new(puzzle) }
 

  context "initializing grid" do 

    it "must create 81 element grid of cell objects when created" do
      expect(grid.cell_array.count).to eq 81
    end

    it "cell 52 with have a position 52" do
      cell = grid.cell_array[51]
      cell.position = 52
      expect(cell.position).to eq 52 
    end

    it "gives a cell its position as it is created" do
      cell = grid.cell_array[24]
      expect(cell.position).to eq 25
    end

    it "cell 1 will have a value of 2 as it is created" do
      puzzle2 = ('2' * 81).to_s
      grid = Grid.new(puzzle2)
      cell = grid.cell_array[0]
      expect(cell.value).to eq 2
    end

    it "cell 52 will have a value 7" do
      cell = grid.cell_array[51]
      cell.value = 7
      expect(cell.value).to eq 7
    end

    it "populates an empty board" do
      cell = grid.cell_array[11]
      grid.create_empty_board
      expect(cell.value).to eq 0
    end

    it "the puzzle is not solved" do
      grid.create_empty_board
      expect(grid.solved?).to be_false 
    end

    it "the puzzle is solved" do
      puzzle2 = ('3' * 81)
      grid = Grid.new puzzle2
      expect(grid.solved?).to be_true
    end

    it "alls cells will be populated with value 3" do
      puzzle2 = ('3' * 81)
      grid = Grid.new puzzle2
      cell = grid.cell_array[4]
      expect(cell.value).to eq 3
    end

    it "populates value 1 from a given puzzle cell 2" do
      cell = grid.cell_array[1]
      expect(cell.value).to eq 1
    end

    it "populates value 9 from a given puzzle cell 16" do
      cell = grid.cell_array[15]
      expect(cell.value).to eq 9
    end
  end

  context "solving the cell" do 
    it "returns numbers which are in selected cell's column" do
      cell = grid.cell_array[9]
      expect(grid.values_in_column_for(cell)).to eq [2,4,5,9,8] 
    end

    it "returns numbers which are in selected cell's row" do
      cell = grid.cell_array[9]
      expect(grid.values_in_row_for(cell)).to eq [1,9,6] 
    end

    it "returns numbers which are in selected cell's square" do
      cell = grid.cell_array[9]
      expect(grid.values_in_square_for(cell)).to eq [1,5,2,7] 
    end

    it "determines the candidate values" do
      cell = grid.cell_array[1]
      expect(grid.candidate_values(cell)).to eq [4, 8]
    end

    it "returns the correct value if correct" do
      cell = grid.cell_array[9]
      expect(grid.candidate_values(cell)).to eq 3
    end

    it "puzzle can be solved" do
      expect(grid.solve_puzzle).to eq 2 
    end






  end
end
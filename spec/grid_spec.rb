require 'grid'
require 'cell'

describe Grid do
  
  let(:grid) { Grid.new }

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
      cell = grid.cell_array[1]
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
      grid.populate_values_from(3)
      expect(grid.solved?).to be_true
    end

    it "alls cells will be populated with value 3" do
      grid.populate_values_from(3)
      cell = grid.cell_array[4]
      expect(cell.value).to eq 3
    end
  end
end
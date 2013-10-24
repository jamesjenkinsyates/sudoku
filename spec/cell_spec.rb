require 'cell'
require 'grid'

describe Cell do 

  let(:grid) { Grid.new puzzle }
  let(:puzzle) { '015003002000100906270068430490002017501040380003905000900081040860070025037204600' }

  context "Initializing the cell" do 
    it "will exist with an initial position" do
      cell = Cell.new 1
      expect(cell.position).to eq 1 
    end

    it "will exist with an initial position if given 2" do
      cell = Cell.new 2
      expect(cell.position).to eq 2
    end

    it "gives it's column when it's position is 38" do
      cell = Cell.new 38
      expect(cell.get_column_for(38)).to eq 2
    end

    it "gives it's row when it's position is 38" do
      cell = Cell.new 38
      expect(cell.get_row_for(38)).to eq 5
    end

    it "gives it's column when it's position is 74" do
      cell = Cell.new 74
      expect(cell.get_column_for(74)).to eq 2
    end

    it "gives it's row when it's position is 74" do
      cell = Cell.new 74
      expect(cell.get_row_for(74)).to eq 9
    end

    it "in position 17 knows which square it is in" do
      cell = Cell.new 17
      expect(cell.get_square_for(17)).to eq 3
    end

    it "in position 74 knows which square it is in" do
      cell = Cell.new 74
      expect(cell.get_square_for(74)).to eq 7
    end

    it "in position 17 knows which column it is in when created" do
      cell = Cell.new 17
      cell.get_column_for 17
      expect(cell.column).to eq 8
    end

    it "in position 45 knows which row it is in in when created" do
      cell = Cell.new 45
      cell.get_row_for 45
      expect(cell.row).to eq 5
    end

    it "in position 45 knows which square it is in in when created" do
      cell = Cell.new 69
      cell.get_row_for 69
      expect(cell.square).to eq 8
    end

    it "will have a value when it is initialized" do
      cell = Cell.new 1, 6
      expect(cell.value).to eq 6 
    end

    it "must know if it has been solved" do
      cell = Cell.new 1, 6
      expect(cell.solved?).to be_true 
    end

    it "must know if it has not been solved" do
      cell = Cell.new 1, 0
      expect(cell.solved?).to be_false 
    end
  end
end
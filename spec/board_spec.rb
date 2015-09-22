require "rspec"
require "board"

describe Board do
  before :each do
    @board = Board.new
  end

  describe "#set_move" do
    it "sets the move on the board" do
      @board.set_move("X", 1)

      expect(@board.current).to eq(["X", 2, 3, 4, 5, 6, 7, 8, 9])
    end
  end

  describe "#game_tie?" do
    it "returns false if the game is not a tie" do

      expect(@board.game_tie?(["X", 2, 3, 4, 5, 6, 7, 8, 9])).to eq(false)
    end
  end

  describe "#available_spaces" do
    it "returns an array of all available spaces on the board" do

      expect(@board.available_spaces).to_not include(String)
    end
  end

  describe "#next_player_move" do
    it "returns the token of the next player" do

      expect(@board.next_player_move).to eq("X")
    end
  end

  describe "#game_over" do
    it "it returns true if there are 3 consecutive X's on the board" do

      expect(@board.game_over?(["X",2,3,"X",5,6,"X",8,9])).to eq(true)
    end

    it "it returns true if there are 3 consecutive O's on the board" do

      expect(@board.game_over?(["O","O","O",4,5,6,7,8,9])).to eq(true)
    end
  end

  describe "#reset_space_at" do
    it "it returns a space on the board filled by a token to it's original number" do
      @board.set_move("X",5)

      expect(@board.reset_space_at(5)).to eq(5)
    end
  end
end

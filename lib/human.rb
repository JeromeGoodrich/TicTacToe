require "player"

class Human < Player

  def make_move(board)
    move = gets.to_i
    return move
  end
end

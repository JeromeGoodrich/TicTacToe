require "./human"
require "./ai"
require "./minimax"

class Player

  def initialize(human,ai,minimax)
    @human = human
    @ai = ai
    @minimax = minimax
  end

  def token(player_order)
    if player_order == [1,2]
      return 'X'
    elsif player_order == [2,1]
      return 'O'
    end
  end

  def make_move(player_order, opponent, turns_completed)
    if player_order == [1,2]
      @human.make_move
    elsif player_order == [2,1] && opponent == "human"
      @human.make_move
    elsif player_order == [2,1] && opponent == "ai"
      @ai.make_move
    elsif player_order == [2,1] && opponent == "minimax"
      @minimax.make_move(turns_completed)
    end
  end
end

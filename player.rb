require "./strategy"

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

  def make_move(player_order, opponent)
    if player_order == [1,2]
      @human.make_move
    elsif player_order == [2,1]
      opponent.make_move
    end
  end
end

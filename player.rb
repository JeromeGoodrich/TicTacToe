require "./strategy"

class Player

  def initialize(strategy)
    @strategy = strategy
  end

  def token(player_order)
    if player_order == [1,2]
      return 'X'
    elsif player_order == [2,1]
      return 'O'
    end
  end

  def make_move(player_order)
    if player_order == [1,2]
      @strategy.human
    elsif player_order == [2,1]
      @strategy.ai
    end
  end
end

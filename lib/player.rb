require "./board"

class Player

  def token(player_order)
    if player_order == [1,2]
      return 'X'
    elsif player_order == [2,1]
      return 'O'
    end
  end
end

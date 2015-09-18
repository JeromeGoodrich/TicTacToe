class Board

  def initialize
    @board = [0,1,2,3,4,5,6,7,8,9]
  end

  def current
    @board
  end

  def set_move(token, move)
      @board[move] = token
      return @board
  end

  def available_spaces
    @board - ["X","O",0]
  end

  def next_player_move
    if available_spaces.size.even?
      return "O"
    else
      return "X"
    end
  end

  def game_over?
    board_s = @board.map {|a| a.to_s}
    first_digit_ary = [1,4,7,1,2,3,1,3]
    second_digit_ary = [2,5,8,4,5,6,5,5]
    third_digit_ary = [3,6,9,7,8,9,9,7]
    n = 0
    while n <= 7
      if board_s[(first_digit_ary[n])] + board_s[(second_digit_ary[n])] + board_s[(third_digit_ary[n])] == "XXX"
        return true
      elsif board_s[(first_digit_ary[n])] + board_s[(second_digit_ary[n])] + board_s[(third_digit_ary[n])] == "OOO"
        return true
      end
      n += 1
    end
  end

  def game_tie?
    if (@board - ["X","O"]) == [0]
    end
  end

  def reset_space_at(space)
    @board[space.to_i - 1] = space
  end
end

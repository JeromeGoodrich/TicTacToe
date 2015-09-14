class Board

  def initialize
    @board = [0,1,2,3,4,5,6,7,8,9]
  end

  def current(board)
    board = @board
  end

  def set_move(token, move)
      @board[move] = token
      current(@board)
      return @board
  end
end

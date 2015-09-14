class Board

  def initialize(ui)
    @board = [0,1,2,3,4,5,6,7,8,9]
    @ui = ui
  end

  def current(board)
    board = @board
  end

  def set_move(token, move)
    if @board[move] == "X" || @board[move] == "O"
      return "invalid"
    else
      @board[move] = token
      current(@board)
      return @board
    end
  end
end

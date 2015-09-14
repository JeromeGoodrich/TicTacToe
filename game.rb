require "./player"
require "./board"
require "./ui"

class Game

  def initialize(player1, player2, board, ui)
    @player1 = player1
    @player2 = player2
    @board = board
    @ui = ui
    @player_type = nil
  end

  def start
    answer = @ui.ask_to_start
    if answer == "y"
      choose_player
    elsif answer == "n"
      @ui.abort
    else
      @ui.error
    end
  end

  def choose_player
    order_request = @ui.which_order
    if order_request == "f"
      @player_order = [1,2]
      game_loop([@player1, @player2])
    elsif order_request == "s"
      @player_order = [2,1]
      game_loop([@player2, @player1])
    else
      @ui.error
    end
  end

  def game_loop(players)
    player = players.first
    @ui.make_move
    move = player.make_move(@player_order)
    token = player.token(@player_order)
    board = @board.set_move(token, move)
    @ui.print_board(board)
      if over?(board)
        @ui.game_over(@player_order)
        start
      else
        @player_order = @player_order.reverse
        game_loop([players.last, players.first])
      end
  end

  def over?(current_board)
    board_s = current_board.map {|a| a.to_s}
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
    #checks for tie
    if (current_board - ["X","O"]) == [0]
      @ui.game_over("tie")
      start
    end
  end
end

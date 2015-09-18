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
      choose_player_order
    elsif answer == "n"
      @ui.abort_message
    else
      @ui.error
    end
  end

  def choose_player_order
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

  def choose_opponent
    type_of_opponent = @ui.which_opponent
      if type_of_opponent == "h"
        return "human"
      elsif type_of_opponent == "a"
        return "ai"
      elsif type_of_opponent == "m"
        return "minimax"
  end

  def game_loop(players)
    turns_completed = 0
    player = players.first
    opponent = choose_opponent
    @ui.make_move
    move = player.make_move(@player_order, opponent, turns_completed)
    token = player.token(@player_order)
    board = @board.set_move(token, move)
    @ui.print_board(board)
      if @board.game_won? || @board.game_tie?
        @ui.game_over(@player_order)
      else
        @player_order = @player_order.reverse
        turns_completed += 1
        game_loop([players.last, players.first])
      end
  end
end


# lib
  # game.rb
  # board.rb
# tic_tac_toe.rb
# README

class Game

  def initialize(human, computer, board, ui)
    @human = human
    @computer = computer
    @board = board
    @ui = ui  
  end

  def start
    ui.greeting
    answer = ui.ask_to_start
    if answer == "y"
      choose_player
    elsif answer == "n"
      abort("maybe next time...")
    else
      error
    end
  end

  def choose_player
    order_request = ui.which_order
    if answer == "f"
      game_loop([@human, @computer])
    elsif answer == "s"
      game_loop([@computer, @human])
    else
      error
    end
  end

  def game_loop(players)
    player = players.first
    move = player.make_move(@board)
    @board.set_move(player.token, move)

    if game_over?
    else
      game_loop([players.last, players.first])
    end
  end

  def win?(current_board)

    board_s = current_board.map {|a| a.to_s}
    first_digit_ary = [1,4,7,1,2,3,1,3]
    second_digit_ary = [2,5,8,4,5,6,5,5]
    third_digit_ary = [3,6,9,7,8,9,9,7]

    n = 0
    while n <= 7
      if board_s[(first_digit_ary[n])] + board_s[(second_digit_ary[n])] + board_s[(third_digit_ary[n])] == "XXX"
        return "human"
      elsif board_s[(first_digit_ary[n])] + board_s[(second_digit_ary[n])] + board_s[(third_digit_ary[n])] == "OOO"
        return "computer"
      end
      n += 1
    end
  end
end

class Board

  def initialize(game)
    @board = [0,1,2,3,4,5,6,7,8,9]
    @game = game
  end

  def mark_space(move, player_type)
      if player_type == "human"
        @board[move] = 'X'
        current_board = @board
        return current_board
      elsif player_type == "computer"
        @board[move] = 'O'
        current_board = @board
        return current_board
      end
  end

  def status
    row_1 = "#{@board[1]} | #{@board[2]} | #{@board[3]} "
    row_2 = "#{@board[4]} | #{@board[5]} | #{@board[6]} "
    row_3 = "#{@board[7]} | #{@board[8]} | #{@board[9]} "
    line = '---------'
      puts row_1
      puts line
      puts row_2
      puts line
      puts row_3
  end
end



class Player

  def initialize
    @winning_combinations = [[1,2,3],[4,5,6],[7,8,9],[1,4,7,],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    @human_moves = []
    @computer_moves = []
  end

  def human_move
    move = gets.to_i
    @human_moves.push move
    return move
  end

  def computer_move
    a = []
    if @human_moves[-1] == 5
      move = [1,3,7,9].sample
      @computer_moves.push move
      return move

    elsif @computer_moves.empty?
      available_moves = (1..9).to_a
      available_moves -= @human_moves
      move = available_moves.sample
      @computer_moves.push move
      return move
    else
      @winning_combinations.each do |i|
        if i.include?(@human_moves[0]) && i.include?(@human_moves[-1])
          # this takes care of any direct case
          a.push i
          a = a.flatten
          a -= @human_moves.flatten
          a -= @computer_moves.flatten
            if a.empty?
              @winning_combinations.each do |i|
                if i.include?(@computer_moves[-1]) || i.include?(@computer_moves[-2])
                  a.push i
                  a = a.flatten
                  a -= @human_moves.flatten
                  a -= @computer_moves.flatten
                end
              end
            end
          move = a.sample
          @computer_moves.push move
          return move
        end
      end
    end
  end
end

class ConsoleUI

  def initialize(player, game, board)
    @player = player
    @game = game
    @board = board
  end

  def greeting
    puts "Hello! would you like to play a game of TicTacToe? type y for yes and n for no"
    
  end

  def choose_player
    puts "Great! let's get started."
    puts "Would you like to play first or second? type f for first and s for second."
    
  end

  def check_win(winner)
    if winner == "human"
      outcome("winner")
    elsif winner == "computer"
      outcome("loser")
    elsif winner == "no winner"
      outcome("tie")
    end
  end

  def human_first_game_play
      @board.status
      puts "Please choose a space on the board using the available numbers 1-9."
      move = @player.human_move
      current_board = @board.mark_space(move, "human")
      winner = @game.win?(current_board)
      check_win(winner)
      computer_first_game_play
  end

  def computer_first_game_play
      @board.status
      move = @player.computer_move
      puts "your opponent moved to #{move}"
      current_board = @board.mark_space(move, "computer")
      winner = @game.win?(current_board)
      check_win(winner)
      human_first_game_play
  end

  def error
    puts "bzzzzt error! ERROR"
  end

  def outcome(outcome)
    if outcome == "winner"
      puts "Congratulations you've won!!!"
    elsif outcome == "loser"
      puts "The computer has won..."
    elsif outcome == "tie"
      puts "The game is a tie..."
    end
    puts "Would you like to play again? y/n"
    answer = gets.chomp
      if answer == "y"
        @game.start
      elsif answer == "n"
        abort("Goodbye")
      else
        error
      end
  end
end


human = Human.new
computere = Computer.new


board = Board.new
console = ConsoleUI.new

game = Game.new(human, computer, board, ui)
game.start

console.greeting

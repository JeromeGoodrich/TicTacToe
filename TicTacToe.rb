class Board

  def select_space(player_type)
    board = [0,1,2,3,4,5,6,7,8,9]
    if player_type == human
       selection = board[gets.to_i]
       mark_space(selection, human)
    elsif player_type == computer
      return player.computer_move
    end
  end

  def mark_space(selection, player_type)
      if player_type == human
        board[selection] = 'X'
        console.computer_move
      elsif player_type == computer
        board[selection] = 'O'
        console.game_play
      end
  end

  def status
    row_1 = "#{BOARD[1]} | #{BOARD[2]} | #{BOARD[3]} "
    row_2 = "#{BOARD[4]} | #{BOARD[5]} | #{BOARD[6]} "
    row_3 = "#{BOARD[7]} | #{BOARD[8]} | #{BOARD[9]} "
    line = '---------'
      puts row_1
      puts line
      puts row_2
      puts line
      puts row_3
  end


end

class Game

  def initialize(board, player, computer, console)
    @board = board
    @player = player
    @computer = computer
    @console = console
  end

  def start
    console.greeting
  end

  def win?

  end

  def order(order)
    if order == first
      console.game_play
    elsif oder == second
      console.computer_move
    end
  end

end

class Player

  def move(type_of_player)

  end

end

class ConsoleUI

  def greeting
    puts "Hello! would you like to play a game of TicTacToe? type y for yes and n for no"
    answer = gets.chomp
      if answer == y
        choose_player
      elsif answer == n
        abort("maybe next time...")
      else
        error
      end
  end

  def choose_player
    puts "Great! let's get started."
    puts "Would you like to play first or second? type f for first and s for second."
    answer = gets.chomp
      if answer == f
        new_game.order(first)
      elsif answer == s
        new_game.order(second)
      else
        error
      end
  end

  def game_play
      puts "Please choose a space on the board using the available numbers 1-9."
      board.select_space(human)
      board.mark_space
  end

  def computer_move
      player.move(computer)
      puts "your opponent moved to #{}"
  end

end

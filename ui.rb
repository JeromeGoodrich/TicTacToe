

class UI

  def ask_to_start
    puts "Would you like to play a game of TicTacToe? type y for yes and n for no"
    gets.chomp
  end

  def abort
    abort("Maybe next time...")
  end

  def which_order
    puts "Great! let's get started."
    puts "Would you like to play first or second? type f for first and s for second."
    gets.chomp
  end

  def print_board(board)
    row_1 = "#{board[1]} | #{board[2]} | #{board[3]} "
    row_2 = "#{board[4]} | #{board[5]} | #{board[6]} "
    row_3 = "#{board[7]} | #{board[8]} | #{board[9]} "
    line = '---------'
    space = ''
      puts space
      puts row_1
      puts line
      puts row_2
      puts line
      puts row_3
      puts space
  end

  def make_move
    puts "Make a move by choosing an available number 1-9"
  end

  def error
    puts "bzzzzt error! ERROR"
  end

  def game_over(outcome)
    if outcome == [1,2]
      puts "Congratulations you've won!!!"
    elsif outcome == [2,1]
      puts "The computer has won..."
    elsif outcome == "tie"
      puts "The game is a tie..."
    end
  end
end

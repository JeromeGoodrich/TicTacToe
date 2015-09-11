class Game
  def initialize(board, player, console)
    @board = board
    @player = player
    @console = console
  end

  def gameplay(player_type)
    if player_type == "human"
      @console.human_first_game_play
    elsif player_type == "computer"
      @console.computer_first_game_play
    else
      @console.error
    end
  end

  def start
   @console.greeting
  end

  def win?(current_board)

    board_s = current_board.map {|a| a.to_s}
    first_digit_ary = [0,2,3,6,0,1,1,0]
    second_digit_ary = [1,4,4,7,3,4,5,4]
    third_digit_ary = [2,6,5,8,6,7,8,8]

    n = 0
    while n <= 7
      if board_s[(first_digit_ary[n])] + board_s[second_digit_ary[n]] + board_s[third_digit_ary[n]] == "XXX"
        @console.outcome("winner")
      elsif board_s[(first_digit_ary[n])] + board_s[second_digit_ary[n]] + board_s[third_digit_ary[n]] == "OOO"
        @console.outcome("loser")
      end
      n += 1
    end
  end
end

class Board < Game

  def initialize
    @board = [0,1,2,3,4,5,6,7,8,9]
  end

  def mark_space(move, player_type)
      if player_type == "human"
        @board[move] = 'X'
        current_board = @board
        win?(current_board)
        gameplay("computer")
      elsif player_type == "computer"
        @board[move] = 'O'
        current_board = @board
        win?(current_board)
        gameplay("human")
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
    if @human_moves.last == 5
      @winning_combinations = [[1,2,3],[7,8,9],[1,4,7,],[3,6,9],[1,5,9],[3,5,7]]
      @winning_combinations.each do |i|
        if i.include?(@human_moves[-1]) && i.include?(@computer_moves[-1])
          a.push i
          a -= @human_moves
          a -= @computer_moves
          move = a.sample
          return move
        end
      end
    elsif @computer_moves.empty?
      available_moves= (1..9).to_a - @human_moves.last.to_a
      move = available_moves.sample
      return move
    else
      @winning_combinations.each do |i|
        if i.include?(@human_moves[-1]) && i.include?(@human_moves[-2])
          a.push i
          a -= @human_moves
          a -= @computer_moves
          move = a.sample
          return move
        end
      end
    end
  end
end

class ConsoleUI

  def initialize(board, player)
    @board = board
    @player = player
  end

  def greeting
    puts "Hello! would you like to play a game of TicTacToe? type y for yes and n for no"
    answer = gets.chomp
      if answer == "y"
        choose_player
      elsif answer == "n"
        abort("maybe next time...")
      else
        error
      end
  end

  def choose_player
    puts "Great! let's get started."
    puts "Would you like to play first or second? type f for first and s for second."
    answer = gets.chomp
      if answer == "f"
        human_first_game_play
      elsif answer == "s"
        computer_first_game_play
      else
        error
      end
  end

  def human_first_game_play
      @board.status
      puts "Please choose a space on the board using the available numbers 1-9."
      move = @player.human_move
      @board.mark_space(move, "human")
  end

  def computer_first_game_play
      @board.status
      move = @player.computer_move
      puts "your opponent moved to #{move}"
      @board.mark_space
  end

  def error
    puts "bzzzzt error! ERROR"
  end

  def outcome(outcome)
    if outcome == "winner"
      puts "Congratulations you've won!!!"
      puts "Would you like to play again? y/n"
    elsif outcome == "loser"
      puts "The computer has won..."
      puts "play again? y/n"
    elsif outcome == "tie"
      puts "The game is a tie..."
      puts "play again? y/n"
    end
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

player = Player.new
board = Board.new
console = ConsoleUI.new(board, player)
game = Game.new(board, player, console)

game.start

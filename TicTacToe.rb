BOARD = [0,1,2,3,4,5,6,7,8,9]

module Moveable
  HUMAN_MOVES = []
  COMPUTER_MOVES = []
  WINNING_MOVES = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]

  def human_move(move)
    puts "It's your turn please pick a space on the board"
    if BOARD[move] == 'X'
      puts "Please pick a valid move"
      move = gets.to_i
      moves(move)
    elsif BOARD[move] == 'O'
      puts "Please pick a valid move"
      move = gets.to_i
      moves(move)
    elsif (1..9)===(move)
      HUMAN_MOVES.push move
      BOARD[move] ='X'
    else
      raise 'error'
    end
  end

  def comp_move(move)
      move = move.flatten
    until (1..9) === (i = BOARD[move.sample.to_i])
      move = move
    end
      COMPUTER_MOVES.push BOARD[i]
      puts "your opponent moved to #{i}"
      BOARD[i] = 'O'
  end

  def first_move(type_of_player)
    if type_of_player == 'human'
      puts 'Please choose a space on the board using the number 1-9.'
      comp_move(BOARD)
    elsif type_of_player == 'computer'
      comp_move(BOARD)
      puts "It's your turn."
      puts 'Please choose a space on the board using the number 1-9.'
      human_move(gets.to_i)
    end
  end

  def second_move(type_of_player)
    if type_of_player == 'human'
      human_move(gets.to_i)
    elsif type_of_player == 'computer'
      a = []
      if HUMAN_MOVES[-1] == 5
        winning_moves = [[1,2,3],[7,8,9],[1,4,7],[3,6,9],[1,5,9],[3,5,7]]
      end
      winning_moves.each do |x|
        a.push x if x.include?(HUMAN_MOVES[-1]) && x.include?(COMPUTER_MOVES[-1])
      end
      a -= HUMAN_MOVES
      a -= COMPUTER_MOVES
      comp_move(a)
    end
  end

  def third_move_and_on(type_of_player)
    if type_of_player == 'human'
      human_move(gets.to_i)
    elsif type_of_player == 'computer'
      a = []
      WINNING_MOVES.each do |x|
        n = 0
        while n <= HUMAN_MOVES.length
          a.push x if x.include?(HUMAN_MOVES.first) && x.include?(HUMAN_MOVES.last)
        n += 1
        end
      end
      a -= HUMAN_MOVES
      comp_move(a)
    end
  end
end

class Player
  include Moveable

  def order(order)
    if order == 'f'
      first_player = 'human'
      second_player = 'computer'
      return first_player, second_player
    elsif order == 's'
      return first_player = 'computer'
      return second_player = 'human'
    else
      puts 'please select f to play first or s to play second'
      order = gets.chomp
      order(order)
    end
  end
end

class Game

  def initialize
    puts "Hello! would you like to play a game of TicTacToe? type y for yes and n for no"
  end

  def board_current
    @row_1 = "#{BOARD[1]} | #{BOARD[2]} | #{BOARD[3]} "
    @row_2 = "#{BOARD[4]} | #{BOARD[5]} | #{BOARD[6]} "
    @row_3 = "#{BOARD[7]} | #{BOARD[8]} | #{BOARD[9]} "
    @line = '---------'
      puts @row_1
      puts @line
      puts @row_2
      puts @line
      puts @row_3
  end

  def win?
    board_s = BOARD.map {|a| a.to_s}
    first_digit_ary = [1,3,4,7,1,2,3,1]
    second_digit_ary = [2,5,5,8,4,5,6,5]
    third_digit_ary = [3,7,6,9,7,8,9,9]

    n = 0
    while n <= 7
      if board_s[(first_digit_ary[n])] + board_s[second_digit_ary[n]] + board_s[third_digit_ary[n]] == "XXX"
        puts "Congratulations! You won! Play again? y/n"
        answer = gets.chomp
        if answer == 'y'
          Game.initialize
        elsif answer == 'n'
        else
          puts 'Please select y for yes or n for no'
        end
      else
        n += 1
      end
    end
  end
end

class Human
  include Moveable

  def says(something)
    if something == 'y'
      puts "Great let's get started"
      puts "Would you like to play first or second? type f for first and s for second."
      answer = (gets.chomp)
      return answer
    elsif something == 'n'
      abort('goodbye')
    else
      puts "Sorry, didn't catch that, please press y for yes and n for no"
      something = gets.chomp
      says(something)
    end
  end
end
class Computer

  include Moveable

  def win?
    board_s = BOARD.map {|a| a.to_s}

    first_digit_ary = [1,3,4,7,1,2,3,1]
    second_digit_ary = [2,5,5,8,4,5,6,5]
    third_digit_ary = [3,7,6,9,7,8,9,9]

    n = 0
    while n <= 7
      if board_s[(first_digit_ary[n])] + board_s[second_digit_ary[n]] + board_s[third_digit_ary[n]] == "000"
        puts "The Computer has won. Play again? y/n"
        answer = gets.chomp

        if answer == 'y'
          Game.initialize
        elsif answer == 'n'
        else
          puts 'Please select y for yes or n for no'
        end
      else
        n += 1
      end
    end
  end
end

game = Game.new
player = Player.new
human = Human.new
computer = Computer.new
x = human.says(gets.chomp) # = 'f'
array_of_order = player.order(x)
game.board_current
array_of_order.each do |type_of_player|
  player.first_move(type_of_player)
  game.board_current
end


first_move[array_of_order[0],array_of_order[1]]
  if type_of_player == 'human'
    player.first_move('human')
    game.win?
    putslayer.first_move('computer')
    game.win?
  end
game.board_current
player.second_move(type_of_player)
game.board_current
player.third_and_on(type_of_player)
game.board_current

count = 0
while count <= 9

  if input == true
    puts "Player_1 its your move. select a number (1-9)"
    human.moves(gets.to_i)
    game.game_status
    human.win?

    if count == 0
      x = computer.second
      p x
      computer.comp_move(x)
      p COMPUTER_MOVES
    else
      x = computer.dominate
      p x
      computer.comp_move(x)
    end

    game.game_status
    computer.win?

  elsif input == false

    if count == 0
      x = computer.first
      computer.comp_move(x)
    elsif count == 1
      x = computer.second
      computer.comp_move(x)
    else
      x = computer.dominate
      computer.comp_move(x)
    end

    game.game_status
    computer.win?
    puts "Player_2 its your move. select a number (1-9)"
    human.moves(gets.to_i)
    game.game_status
    human.win?

  else
    raise "error"
  end
  count += 1
end




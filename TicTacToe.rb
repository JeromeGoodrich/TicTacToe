#create a game of TicTacToe to be played in the command line.
# first we need two players 1 human, 1 computer
# we need a way to start the game
# next we need to draw the board.
# then we need to have a system to populate the board. i.e what do we select
# then we need a way to add Xs and Os to the board.
# and an interface to tell us what the computer selected and asking us to select a tile
# we need a way to keep a tally of which pieces on the board are left
# we need a way to determine a tie or a winner.

BOARD = {1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7, 8 => 8, 9 => 9}

class Game
  attr_accessor :human, :computer

  def game_status
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

  def player_order(order)
    if order == 'f'
      return true
    elsif order == 's'
      return false
    else
      puts 'please select f to play first or s to play second'
      order = gets.chomp
      player_order(order)
    end
  end
end

class Human

  def says(something)
    if something == 'y'
      puts "Great let's get started"
    elsif something == 'n'
      abort('goodbye')
    else
      puts "Sorry, didn't catch that, please press y for yes and n for no"
      something = gets.chomp
      says(something)
    end
  end

  def plays(move)
    if (1..9)===(move)
      BOARD[move] ='X'
    end

  end
end

class Computer
  def comp_plays(move)
    until (1..9) === BOARD[move]
      move = BOARD[rand(1..9)]
    end
    puts "your opponent moved to #{BOARD[move]}"
    BOARD[move] = 'O'
  end
end

game = Game.new
human = Human.new
computer = Computer.new
puts "Hello! would you like to play a game of TicTacToe? type y for yes and n for no"
human.says(gets.chomp)
game.game_status
puts "Great! would you like to play first or second? type f for first and s for second."
input = game.player_order(gets.chomp)

count = 0
while count <= 9

  if input == true
    puts "Player_1 its your move. select a number (1-9)"
    human.plays(gets.to_i)
    game.game_status
    computer.comp_plays(rand(1..9))
    game.game_status
  elsif input == false
    computer.comp_plays(rand(1..9))
    game.game_status
    puts "Player_2 its your move. select a number (1-9)"
    human.plays(gets.to_i)
    game.game_status
  else
    raise "error"
  end

  count += 1
end



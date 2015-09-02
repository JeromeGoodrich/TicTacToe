#create a game of TicTacToe to be played in the command line.
# first we need two players 1 human, 1 computer
# we need a way to start the game
# next we need to draw the board.
# then we need to have a system to populate the board. i.e what do we select
# then we need a way to add Xs and Os to the board.
# and an interface to tell us what the computer selected and asking us to select a tile
# we need a way to keep a tally of which pieces on the board are left
# we need a way to determine a tie or a winner.
class Game
  BOARD = {1 => '1', 2 => '2', 3 => '3',4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'}
  attr_accessor :human, :computer, :player_1, :player_2

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

  def respond(response)
    if response == 'y'
      puts "Great let's get started"
      p = Game.new
    elsif response == 'n'
      abort('goodbye')
    else
      # if the user doesn't put y or n in I'm having troube restarting the process - none of the loops seem to work.
      puts "Sorry, didn't catch that, please press y for yes and n for no"
      input = gets.chomp
      respond(input)
    end
  end

  def order(order)
    if order == 'f'
      return true
    elsif order == 's'
      return false
    else
    end
  end

  def human_move(number)
    if (1..9)===(number)
      BOARD[number] ='X'
    end
  end
  def comp_move(number)
    until (1..9) === number
      number = BOARD[rand(1..9)]
    end
    puts "your opponent moved to #{BOARD[number]}"
    BOARD[number] = 'O'
  end
end

p = Game.new
puts "Hello! would you like to play a game of TicTacToe? type y for yes and n for no"
p.respond(gets.chomp)
p.board_current
puts "Great! would you like to play first or second? type f for first and s for second."
input = p.order(gets.chomp)
count = 0
while count <= 9

  if input == true
  puts "Player_1 its your move. select a number (1-9)"
  p.human_move(gets.to_i)
  p.board_current
  p.comp_move(rand(1..9))
  p.board_current
  elsif input == false
  p.comp_move(rand(1..9))
  p.board_current
  puts "Player_2 its your move. select a number (1-9)"
  p.human_move(gets.to_i)
  p.board_current
  else
    raise "error"
  end

  count += 1
end



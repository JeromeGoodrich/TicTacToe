require "./board"
require "./game"
require "./player"
require "./ui"
require "./human"
require "./ai"
require "./minimax"

board = Board.new
human = Human.new
minimax = Minimax.new(board)
ai = Ai.new(board)
player1 = Player.new(human,ai,minimax)
player2 = Player.new(human,ai,minimax)
ui = UI.new
game = Game.new(player1,player2, board, ui)

game.start

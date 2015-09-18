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
ui = UI.new
game = Game.new(ai,human,minimax,board,ui)

game.start

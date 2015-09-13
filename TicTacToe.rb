require "./board"
require "./game"
require "./player"
require "./strategy"
require "./ui"

strategy = Strategy.new()
player1 = Player.new(strategy)
player2 = Player.new(strategy)
board = Board.new
ui = UI.new
game = Game.new(player1,player2, board, ui)

game.start

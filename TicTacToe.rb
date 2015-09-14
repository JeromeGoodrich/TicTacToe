require "./board"
require "./game"
require "./player"
require "./strategy"
require "./ui"

strategy = Strategy.new()
player1 = Player.new(strategy)
player2 = Player.new(strategy)
ui = UI.new
board = Board.new(ui)
game = Game.new(player1,player2, board, ui)

[1,2,3].include?([1,2])
game.start

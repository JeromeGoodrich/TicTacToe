strategy = Strategy.new()
player1 = Player.new(strategy)
player2 = Player.new(strategy)
board = Board.new
ui = UI.new(board,player1,player2,)
game = Game.new(player1,player2, board, ui)

game.start

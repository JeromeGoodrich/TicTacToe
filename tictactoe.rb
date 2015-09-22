$: << File.expand_path('../lib', __FILE__)

require 'board'
require 'human'
require 'minimax'
require 'ai'
require 'ui'
require 'game'

board = Board.new
human = Human.new(board)
minimax = Minimax.new(board)
ai = Ai.new(board)
ui = UI.new
game = Game.new(ai,human,minimax,board,ui)

game.start

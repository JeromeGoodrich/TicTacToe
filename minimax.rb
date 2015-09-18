class Minimax


@winning_combinations = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
@game_state =
# we assign values to game states in order to find the best possible move
# win = 1, loss = -1, draw or intermediate state = 0
# there's also this idea of depth to account for since we want the ai
# to play a game that will lead to the quicket possible victory or tie
# Since minimax is recursive we need to let it know when the game is over.
# and have it pick the move with the best score.

def make_move(board, turns_completed)
  return @game.score if game.win?(@human)
  depth += 1
  scores = []
  moves = []

  # step 1: look at current available_moves

  #step 2: pick an available move
  #step 3: simulate the opponent picking a move
  @board.available_spaces.each do |space|
    possible_board = @board.set_move(@board.next_player_move, space)
    scores << make_move(possible_board, turns_completed)
    moves << space
  end

  #find the space that gives the highest score
  if player [1,2]
    max_index = scores.each_with_index.max[1]
    move = moves[max_index]
    return move
  else
    min_index = scores.each_with_index.min[1]
    move = moves[min_index]
    return move
  end
end


  #step 4: repeat until a winner is determined or there's a tie
  #step 5: capture the outcome in a score
  #step 6: assign that score to the initial move.
  #step 7: repeat 1-6 for all other available moves
  #step 8: look at the aggregate scores of each initial move
  #step 9: pick the move that has the highest score.



# Otherwise get a list of new game states for every possible move
# Create a scores list
# For each of these states add the minimax result of that state to the scores list
# If it's X's turn, return the maximum score from the scores list
# If it's O's turn, return the minimum score from the scores list

end

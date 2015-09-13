class Strategy

  def initialize
    @winning_combinations = [[1,2,3],[4,5,6],[7,8,9],[1,4,7,],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    @human_moves = []
    @computer_moves = []
  end

  def human
    move = gets.to_i
    @human_moves.push move
    return move
  end

  def ai
    a = []
    if @human_moves[-1] == 5
      move = [1,3,7,9].sample
      @computer_moves.push move
      return move

    elsif @computer_moves.empty?
      available_moves = (1..9).to_a
      available_moves -= @human_moves
      move = available_moves.sample
      @computer_moves.push move
      return move
    else
      @winning_combinations.each do |i|
        if i.include?(@human_moves[0]) && i.include?(@human_moves[-1])
          # this takes care of any direct case
          a.push i
          a = a.flatten
          a -= @human_moves.flatten
          a -= @computer_moves.flatten
            if a.empty?
              @winning_combinations.each do |i|
                if i.include?(@computer_moves[-1]) || i.include?(@computer_moves[-2])
                  a.push i
                  a = a.flatten
                  a -= @human_moves.flatten
                  a -= @computer_moves.flatten
                end
              end
            end
          move = a.sample
          @computer_moves.push move
          return move
        end
      end
    end
  end
end

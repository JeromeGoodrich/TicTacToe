class Strategy

  def initialize
    @winning_combinations = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    @human_moves = []
    @computer_moves = []
  end

  def human
    move = gets.to_i
    if @human_moves.include?(move)
      return move
    else
      @human_moves.push move
      @human_moves
      return move
    end
  end

  def ai
    a = []
    b = []
    # first computer move where first human move is odd
    if @computer_moves.empty? && (@human_moves[-1]).odd?
      move = [1,3,5,7,9].sample
        if @human_moves.include?(move)
          ai
        else
          @computer_moves.push move
          return move
        end
    # first computer move where first human move is even
    elsif @computer_moves.empty? && (@human_moves[-1]).even?
      @winning_combinations.each do |i|
        if i.include?(@human_moves[-1])
          a.push i
          a.each do |j|
            if j.include?(5)
              b.push j
              b = b.flatten
              b -= @human_moves
              move = b.sample
              @computer_moves.push move
              return move
            end
          end
        end
      end

    else
      new_array = @human_moves.combination(2).to_a
      @winning_combinations.each do |i|
        new_array.each do |j|
          if i.include?(j)
            p a = i.flatten - j
          end
        end
      end
      a = a.flatten
      a -= @human_moves.flatten
      a -= @computer_moves.flatten
      move = a.sample
      @computer_moves.push move
      return move
    end
  end
end


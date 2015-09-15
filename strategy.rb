class Strategy

  def initialize
    @winning_combinations = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
  end

  def human
    a =[]
    b =[]
    move = gets.to_i
    @winning_combinations.each do |i|
      if i.include?(move)
        a << (i - [move] << "X")
      else
        b << i
      end
      @winning_combinations = a + b
    end
    return move
  end

  def ai
    a = []
    b = []
    c = []
    if (@winning_combinations.flatten.include?(5)) == false && (@winning_combinations.flatten.include?("O") == false)
      move = [1,3,7,9].sample
      replace_move(move)
      return move
    # finds any potential winning combo that has 2 in a row and fills in the 3rd
    elsif @winning_combinations.flatten.include?("O")
      @winning_combinations.each do |i|
        if i.detect{ |e| i.count(e) > 1 } == ("X" || "O")
        p  a << i
        # if no moves are available that meet the criteria above, find combos that
        # correspond to combinations with token "O" and pushes them into array b
        elsif i.include?("O")
          b << i
        end
        p  b -= a
        end
            a = a.flatten
            a -= ["X"]
            a -= ["O"]
          if a.empty?
            a = b
          end
            a = a.flatten
            a -= ["X"]
            a -= ["O"]
            move = a.sample
            replace_move(move)
            return move
    else
        move = 5
        replace_move(move)
        return move
    end
  end

  #replaces move with token.
  def replace_move(move)
    a =[]
    b =[]
    @winning_combinations.each do |i|
      if i.include?(move)
        a << (i - [move] << "O")
      else
        b << i
      end
      @winning_combinations = a + b
    end
  end
end

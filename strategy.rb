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
    @winning_combinations.each do |i|
      if i.include?("O")

        #removes eroneous combinations
        if i.include?("X") && i.include?("O")
          @winning_combinations -= i
        #else
          #@winning_combinations = winning_combinations
        end
        #looks at relevant combinations and pushes numbers into array a
        @winning_combinations.each do |x|
          if x.include?("X") || x.include?("O")
            a << x
          end
        end
           #finds all valid, smart moves
            a = a.flatten
            a -= ["X"]
            a -= ["O"]
            move = a.sample
            replace_move(move)
            return move

      else
          # 5 is the best first move if available
          move = 5
          replace_move(move)
          return move
      end
    end
  end

  #replaces move with token.
  def replace_move
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


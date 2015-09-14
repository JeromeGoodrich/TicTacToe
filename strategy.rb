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
    if @winning_combinations.include?("O")
      @winning_combinations.each do |i|
        if i.include?("X") && i.include?("O")
          @winning_combinations -= i
        end
      end

      @winning_combinations.each do |i|
        if i.include?("X") || i.include?("O")
          a << i
        end
      end
      a = a.flatten
      a -= ["X"]
      a -= ["O"]
      move = a.sample
      @winning_combinations.each do |i|
        if i.include?(move)
          b << (i - [move] << "O")
        else
          c << i
        end
        @winning_combinations = a + b
      end
      return move
    elsif
      move = 5.to_i
      @winning_combinations.each do |i|
        if i.include?(move)
          a << (i - [move] << "O")
        else
          b << i
        end
        @winning_combinations = a + b
      end
      return move
    end
  end
end


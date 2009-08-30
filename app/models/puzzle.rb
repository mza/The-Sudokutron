class Puzzle
  
  attr_accessor :board, :rows, :columns
  
  def initialize
    @rows = 9
    @columns = 9
    @board = [0] * @rows
    for row in (0..@rows - 1)
      @board[row] = [0] * @columns
    end

    grid_1_numbers = (1..9).sort_by{rand}
    grid_5_numbers = (1..9).sort_by{rand}
    grid_9_numbers = (1..9).sort_by{rand}
    
    @board[0][0..2] = grid_1_numbers[0..2]
    @board[1][0..2] = grid_1_numbers[3..5]
    @board[2][0..2] = grid_1_numbers[6..8]
    
    @board[3][3..5] = grid_5_numbers[0..2]
    @board[4][3..5] = grid_5_numbers[3..5]
    @board[5][3..5] = grid_5_numbers[6..8]
    
    @board[6][6..8] = grid_5_numbers[0..2]
    @board[7][6..8] = grid_5_numbers[3..5]
    @board[8][6..8] = grid_5_numbers[6..8]
  end
  
  
  
  def to_s
    string = spacer_row
    for row in 0..(@rows - 1)
      string += "|"
      for column in 0..(@columns - 1)
        string += " #{@board[row][column]} "
        if (column + 2) % 3 == 1
          string += "|"
        end
      end
      string += "<br />"
      if (row + 2) % 3 == 1
         string += spacer_row
       end
    end
    string
  end
  
  def spacer_row
    string = "+-"
    for column in 0..(@columns - 1)
      string = string + "--"
      if (column + 2) % 3 == 1
        string = string + "+-"
      end
    end
    string.chop!
    string += "<br />"
  end
  
  def logger
    Rails.logger
  end
  
end
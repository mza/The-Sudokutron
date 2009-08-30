class Puzzle
  
  attr_accessor :board, :rows, :columns, :possibles
  
  def initialize
    @rows = 9
    @columns = 9
    @board = [0] * @rows
    @possibles = [0] * @rows
    for row in (0..@rows - 1)
      @board[row] = []
      @possibles[row] = []
      for column in (0..@columns - 1)
        @board[row][column] = 0
        @possibles[row][column] = 0..9
      end
    end

    grid_1_numbers = (1..9).sort_by{rand}
    grid_5_numbers = (1..9).sort_by{rand}
    grid_9_numbers = (1..9).sort_by{rand}
    
    assign_grid 0..2, 0..2, grid_1_numbers
    assign_grid 3..5, 3..5, grid_5_numbers
    assign_grid 6..8, 6..8, grid_9_numbers
        
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
  
  private
  
  def assign_grid(rows, cols, incoming)
    index = 0
    for row in rows
      for col in cols
        @board[row][col] = incoming[index]
        index = index + 1
      end
    end
  end
  
  def logger
    Rails.logger
  end
  
end
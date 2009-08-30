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
        @possibles[row][column] = (1..9).to_a
      end
    end
    
    assign_to_grid 0..2, 0..2, (1..9).sort_by{rand}
    assign_to_grid 3..5, 3..5, (1..9).sort_by{rand}
    assign_to_grid 6..8, 6..8, (1..9).sort_by{rand}
    
    reduce
  end
  
  def reduce
    for row in 0..(@rows - 1)
      for column in 0..(@columns - 1)
        if @possibles[row][column].size > 1
          @possibles[row][column] = @possibles[row][column] - ( @board[row] | column_numbers(column) | grid_numbers(row, column) )
          logger.debug "Reducing ROW #{row}, COLUMN #{column}:"
          logger.debug "ROW: #{@board[row]}"
          logger.debug "COL: #{column_numbers(column)}"
          logger.debug "GRI: #{grid_numbers(row, column).join(', ')}"
          logger.debug "POS: #{@possibles[row][column].join(', ')}"
          logger.debug
        end
      end
    end
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
  
  def column_numbers(col)
    @board.map{|r| r[col]}
  end
  
  def grid_number(row, col)
    (row - (row % 3)) + (col / 3)
  end
  
  def grid_numbers(row, col)
    start_row = (row - (row % 3))
    start_col = (col / 3) * 3
    numbers = []
    for grid_row in (start_row...(start_row + 2))
      for grid_col in (start_col..(start_col + 2))
        numbers << @board[grid_row][grid_col]
      end
    end
    numbers
  end
  
  def assign_to_grid(rows, cols, incoming)
    index = 0
    for row in rows
      for col in cols
        @board[row][col] = incoming[index]
        @possibles[row][col] = (incoming[index]).to_a
        index = index + 1
      end
    end
  end
  
  def logger
    Rails.logger
  end
  
end
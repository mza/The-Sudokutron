class Puzzle
  
  attr_accessor :board, :rows, :columns, :possibles
  
  def initialize(incoming = nil)
    
    @rows = 9
    @columns = 9

    if incoming.nil?
      valid_board = false
      while !valid_board
        seed_board
        logger.debug self.to_s
        reduce
        quick_fill
        logger.debug self.to_s
        valid_board = check_valid
      end
    else
      @board = incoming
    end
  
  end
  
  def puzzleify(rating)
    new_board = []
    for row in 0..(@rows -1)
      new_board[row] = []
      for column in 0..(@columns - 1)
        new_board[row][column] = @board[row][column]
      end
    end
    new_puzzle = Puzzle.new(new_board)
    new_puzzle.create_puzzle :easy
    return new_puzzle
  end
  
  def create_puzzle(rating)
    difficulty = { :easy => 74 }
    difficulty[rating].times do
      @board[rand(@rows)][rand(@columns)] = 0
    end
  end
  
  def seed_board
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
  end
  
  def reduce
    for row in 0..(@rows -1)
      for column in 0..(@columns - 1)
        if @possibles[row][column].size > 1
          @possibles[row][column] = @possibles[row][column] - ( row_numbers(row) | column_numbers(column) | grid_numbers(row, column) )     
        end
        
        if @possibles[row][column].size == 1
          @board[row][column] = @possibles[row][column].first
        end
        
      end
    end
  end
  
  def quick_fill
    fill_rows = @rows - 1
    for row in 0..(fill_rows)
      for column in 0..(@columns - 1)
        if @possibles[row][column].size > 1
          fix_value = @possibles[row][column].rand
          @board[row][column] = fix_value
          @possibles[row][column] = (fix_value).to_a
        elsif @possibles[row][column].size == 1
          fix_value = @possibles[row][column].first
          @board[row][column] = fix_value
        end
        reduce
      end
    end
  end
  
  def check_valid
    valid = true
    for row in 0..(@rows - 1)
      for column in 0..(@columns - 1)
        if @board[row][column] == 0
          valid = false
        end
      end
    end
    valid
  end
  
  def to_html(prefix = nil)
    unless prefix.nil?
      prefix = "#{prefix}_"
    end
    string = "<table width='100%' cellspacing='0' cellpadding='0' class='puzzle'>"
    for row in 0..(@rows - 1)
      if (row + 2) % 3 == 1
        td_class = "limit"
      else
        td_class = ""
      end
      string += "<tr>"        
      for column in 0..(@columns - 1)
        to_insert = "<input type='text' class='number' id='#{row}_#{column}' name='number' maxlength='1' value='' size='1' />"
        if (column + 2) % 3 == 1
          side_limit = " side_limit"
        else
          side_limit = ""
        end
        unless @board[row][column] == 0
          to_insert = "<span id='#{prefix}#{row}_#{column}'>#{@board[row][column]}</span>"
        end
        string += "<td class='#{td_class} #{side_limit}'>#{to_insert}</td>"
      end
      string += "</tr>"
    end
    string += "</table>"
    string
  end
  
  def to_s
    self.to_s_with_line_ending "\n"
  end
  
  def to_s_with_line_ending(ending, form = false)
    string = spacer_row + ending
    for row in 0..(@rows - 1)
      string += "|"
      for column in 0..(@columns - 1)
          to_insert = "_"
        unless @board[row][column] == 0
          to_insert = @board[row][column]
        end
        string += " #{to_insert} "
        if (column + 2) % 3 == 1
          string += "|"
        end
      end
      string += ending
      if (row + 2) % 3 == 1
         string += spacer_row + ending
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
  end
  
  private
  
  def row_numbers(row)
    @board[row]
  end
  
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
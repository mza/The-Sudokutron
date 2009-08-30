class SudokuController < ApplicationController
  
  def new
    @puzzle = Puzzle.new
  end
  
end

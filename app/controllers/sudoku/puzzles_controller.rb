class Sudoku::PuzzlesController < ApplicationController
  
  layout 'sudoku'
  
  def new
    @puzzle = Puzzle.new
  end
  
end
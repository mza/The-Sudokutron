class Sudoku::SolutionsController < ApplicationController
  
  layout 'sudoku'
  
  def new
    @puzzle = Puzzle.new
  end
  
end
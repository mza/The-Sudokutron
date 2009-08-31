class SudokuController < ApplicationController
  
  def new
    @puzzle = Puzzle.new
  end
  
  def command
    case params[:command]
      when "challenge" then redirect_to :action => :new
      else redirect_to help_url
    end
  end
  
end

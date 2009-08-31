class SudokuController < ApplicationController
    
  def command
    case params[:command]
      when "challenge" then redirect_to new_puzzle_url
      when "generate" then redirect_to new_solution_url
      else redirect_to help_url
    end
  end
  
end

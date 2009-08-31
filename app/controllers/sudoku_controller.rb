class SudokuController < ApplicationController
    
  def command
    case params[:command]
      when "challenge" then redirect_to new_puzzle_url
      when "generate" then redirect_to new_solution_url
      when "source" then redirect_to "http://github.com/mza"
      when "internals" then redirect_to :controller => :help, :action => :internals
      else redirect_to help_url
    end
  end
  
end

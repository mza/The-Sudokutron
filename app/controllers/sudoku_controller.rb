class SudokuController < ApplicationController
    
  def command
    case params[:command]
      when "challenge", "yes", "go", "start" then redirect_to new_puzzle_url
      when "generate" then redirect_to new_solution_url
      when "prince", "princey", "princelangdon" then redirect_to :controller => :help, :action => :prince # for nellie
      when "global thermonuclear war" then redirect_to :controller => :help, :action => :wargames
      when "source" then redirect_to "http://github.com/mza/The-Sudokutron/"
      when "internals", "about" then redirect_to :controller => :help, :action => :internals
      else redirect_to help_url
    end
  end
  
end

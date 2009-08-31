module SudokuHelper
  
  def challenge_message
    [ 
      "the sudokutron feels a disturbance in the force",
      "challenge accepted", 
      "the sudokutron obliges"
     ].rand
  end
  
  def welcome_message
    [ 
      "do you want to play a game?",
      "prepare for battle"
     ].rand
    
  end
  
end

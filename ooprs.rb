# 1) 2 Players, one human and one computer.  Human gets to pick a hand, computer has the hand randomly assigned.
# 2) Hands are available from 3 choices, Paper (defeats rock), Rock (defeats scissors), and Scissors (defeats paper)
# 3) Once each player has selected a hand, the hands are compared and a winner is chosen.  Ties are just ties.  All hands result in player being asked to play again.

class Players
  attr_accessor :prs_option
  attr_reader :name
end

class Human < Players
  def initialize(name)
    @name = name
  end
  
  def pick_hand
    begin  
      puts "What do you choose? (p/r/s)?"
      self.prs_option = gets.chomp.downcase
    end until Hand::PRS_OPTIONS.keys.include?(prs_option)
    
  
  end
end

class Computer < Players
  def initialize(name)
    @name = name
  end
  
  def pick_hand
    self.prs_option = Hand::PRS_OPTIONS.keys.sample
  end
end

class Hand
  PRS_OPTIONS = { 'p'=> 'Paper', 'r'=> 'Rock', 's'=> 'Scissors' }
end

class Game
attr_reader :human, :computer, :prs_option

  def initialize
    @human = Human.new("Chris")
    @computer = Computer.new("Megatron")
  end
  
  def compare_hands
    if (human.prs_option == 'p' && computer.prs_option == 'r') ||(human.prs_option =='r' && computer.prs_option == 's') || (human.prs_option == 's' && computer.prs_option == 'p')
      puts "You win!"
    elsif (human.prs_option == computer.prs_option)
      puts "You tie"
    else
      puts "You lose"
    end
  end
  
  def play
    begin  
      puts "Welcome to Paper Rock Scissors!"
      human.pick_hand
      computer.pick_hand
      puts "#{human.name} has picked #{human.prs_option}"
      puts "#{computer.name} has picked #{computer.prs_option}"
      compare_hands
      puts "Do You Want To Play Again? (Y/N)"
      answer = gets.chomp.downcase
    end until answer == "n" 
  end
end


Game.new.play


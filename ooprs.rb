# 1) 2 Players, one human and one computer.  Human gets to pick a hand, computer has the hand randomly assigned.
# 2) Hands are available from 3 choices, Paper (defeats rock), Rock (defeats scissors), and Scissors (defeats paper)
# 3) Once each player has selected a hand, the hands are compared and a winner is chosen.  Ties are just ties.  All hands result in player being asked to play again.

class Players
attr_accessor :prsoption
attr_reader :name
end

class Human<Players
  def initialize(name)
    @name = name
  end
  
  def pick_hand
    puts "What do you choose? (p/r/s)?"
    self.prsoption = gets.chomp.downcase
  end
end

class Computer<Players
  def initialize(name)
    @name = name
  end
  
  def pick_hand
    self.prsoption = Hand::PRSOPTIONS.keys.sample
  end
end

class Hand
  PRSOPTIONS = { 'p'=> 'Paper', 'r'=> 'Rock', 's'=> 'Scissors' }
end

class Game
attr_reader :human, :computer, :prsoption

  def initialize
    @human = Human.new("Chris")
    @computer = Computer.new("Megatron")
  end
  
  def compare_hands
    if (human.prsoption == 'p' && computer.prsoption == 'r') ||(human.prsoption =='r' && computer.prsoption == 's') || (human.prsoption == 's' && computer.prsoption == 'p')
      puts "You win!"
    elsif (human.prsoption == computer.prsoption)
      puts "You tie"
    else
      puts "You lose"
    end
  end
  
  def play
    human.pick_hand
    computer.pick_hand
    puts "#{human.name} has picked #{human.prsoption}"
    puts "#{computer.name} has picked #{computer.prsoption}"
    compare_hands
  end
end

begin
Game.new.play
puts "Do You Want To Play Again? (Y/N)"
answer = gets.chomp.downcase
end until answer == "n"

#---------------------------------------------------------------------------------
#
# Script Name:	Crazy8ball.rb
# Version:	1.0
# Author:	Kelvin Penn
# Date:		April 2018
#
# Description: This Ruby script demonstrates how to work with variables. It 		#	generates random numbers to create a fourtune-telling game that provides 	#	randomly selected answers to the player's questions. 
#
#---------------------------------------------------------------------------------

class Screen
  def cls
    puts ("\n" * 25)
    puts "\a"

  end
 
  def pause 
    STDIN.gets
  end

class Ball
  attr_accessor :randomNo, :greeting, :question, :goodbye

  def get_fortune
    randomNo = 1 + rand(6)

    case randomNo
      when 1
        $prediciton = "yes"
      when 2
        $preditction = "no"
      when 3
        $prediction = "maybe"
      when 4
        $prediction = "hard to tell. Try again"
      when 5
        $prediction = "unlikely"
      when 6
        $prediction = "unknown"
    end
  end

def say_greeting
  greeting = "\t\t Welcome to the Virtual Crazy 8-ball game \n\n\n\n\n\n\n\n\n" +
  "Press Enter to continue."
  print greeting
end 

def get_question
  question = "Type your question and press the Enter key. \n\n:"
  print question
end

def tell_fortune()
  print "The answer is" + $prediction + ".\n\n: "
end

def say_goodbye
  goodbye = "Thanks for playing the Virtual Crazy 8-Ball game! \n\n"
  puts goodbye
  end
end

Console_Screen = Screen.new
Eight_Ball = Ball.new

Console_Screen.cls

Eight_Ball.say_greeting

Console_Screen.pause

answer = ""

until answer == "y" || answer == "n"
  Console_Screen.cls

print "Would you like to have your fortune predicted? (y/n)\n\n: "

answer = STDIN.gets
answer.chop!

end

if answer == "n"
Console_Screen.cls
puts "Okay, perhaps another time \n\n"

else
gameOver = "No"

until gameOver == "Yes"
  Console_Screen.cls
  Eight_Ball.get_question
  Eight_Ball.get_fortune

  Console_Screen.pause

  Console_Screen.cls

  Eight_Ball.tell_fortune

  Console_Screen.pause

  Console_Screen.cls

  print "Press enter to ask another question or type q to quit. \n\n: "

  answer = STDIN.gets
  answer.chop!

  if answer == "q"
      gameOver = "Yes"
    end
end

Console_Screen.cls

Eight_Ball.say_goodbye

  end
end
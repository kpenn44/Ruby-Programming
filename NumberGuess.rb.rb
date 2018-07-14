#Script Name: NumberGuess.rb
#Version 1.0
#Author: Kelvin Penn
#Date: May 2018
#
#Description: This Ruby script is a number guessing game that challenges 
#the player to guess a randomly generated number in as few 
#guesses as possible.
#
#----------------------------------------------------------------------------

# Define Cusomt classes

# define a class representing the console window
class Screen

	def cls #define a method that clears the display are
		puts ("\n" * 25) #Scroll the screen 25 times

	puts "\a" #make a little noise to get the player's attention

end

def pause # define a method that pauses the display

	STDIN.gets #exeute the STDIN class's gets method to pause script #execution until player presses Enter key

end
end

#define a class representing the Ruy Number Guessing Game
class Game

	def display_greeting

		Console_Screen.cls #clear the display area

		#display welcome message
		print "\t\t Welcome to the Ruby Number Guessing Game!" +
		"\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to continue."

		Console_Screen.pause


end

#define a method to be used to present game instructions 
def display_instructions

	Console_Screen.cls #clear the display area
	puts "INSTRUCTIONS:\n\n" #display a heading

	#display the game's instrucitons
	puts "This game ranomly generates a number from 1 to 1000 and" 
	puts "challenges you to identify it in as few guesses as possible." 
	puts "After each guess, the game will analyze your input and provide" 
	puts "you with feedback. You may take as many turns as you need in " 
	puts "order to guess the game's secret number.\n\n\n Good luck!\n\n\n" 
	print "Press Enter to continue."

	 Console_Screen.pause

	end

	#define a method that generates the game's number
def generate_number
 
  #generate and return a random number from 1 to 100
  return randomNO = 1 + rand(1000)

  end 

#define a method to be used to control game play
def play_game

	#call on the generate_number method to get a random number
    number = generate_number

    #loop unt the player inputs a valid answer
    loop do 
    	Console_Screen.cls

    	#prompt the player to make a guess
    	print "\nEnter your guess and press the Enter key: "

    	reply = STDIN.gets #collect the player's answer
    	reply.chop! #remove the end of line character
    	reply = reply.to_i #conver the player's guess to an integer

    	#validate the player's input only allowing gueses from 1 to 100
    	if reply == "c"

    		Console_Screen.cls

    		SQ.display_credits
    		puts $gameCount
    		break
    	elsif reply < 1 or reply > 1000 then
    		Console_Screen.cls
    		print "Guesses must be between 1 and 1000. Press Enter to continue"

    		Console_Screen.pause
    		redo #redo the current iteration of the loop
    end

    #analyze the players guess to determine if it is correct
    if reply == number then #the player's guess was correct

    	Console_Screen.cls #clear the display area
    	$noOfGuesses = $noOfGuesses + 1
    	print "You have guessed the number! Press Enter to continue."
    	Console_Screen.pause #pause the game
    	break #exit loop
    elsif reply < number then #the player's guess was too low

    	Console_Screen.cls #clear the display area
    	$noOfGuesses = $noOfGuesses + 1
    	print "Your guess is too low! Press Enter to continue."
    	Console_Screen.pause #puse the game
        
    elsif reply > number then

    	Console_Screen.cls #clear the display are
    	$noOfGuesses = $noOfGuesses + 1
    	print "Your guess is too high! Press Enter to conitnue."
    	Console_Screen.pause #pause the game

    end

end
end


#this method displays the information about the ruby Number Guessing Game
def display_credits

	Console_Screen.cls #clear the display area

	#thank the playser and display game information

puts "\t\tThank you for playing the Ruby Number Guessing Game.\n\n\n\n"
puts "\n\t\t\t Developed by Kelvin Penn\n\n"
puts "\t\t\t\t Copyright 2010\n\n"
puts "\t\t\tURL: http://www.tech-publishing.com\n\n\n\n\n\n\n\n\n"

end
end
#Main Script Logic--------------------------------------------------------

answer = ""
$gameCount = 0
$noOfGuesses = 0
$totalNoOfGuesses = 0
$avgNoOfGuesses = 0

Console_Screen = Screen.new #instantiate a new screen object
SQ = Game.new #instantiate a new game object

#execute the game class's display greeting method

SQ.display_greeting


#loop until the player enters y or n and do not accept an other input
loop do 

	Console_Screen.cls #clear the display are

	#prompt player for permission to start game
	print "Are you ready to play the Ruby Nuber Guessing Game? (y/n): "

	answer = STDIN.gets #collect the player's response
	answer.chop! #remov any extra characters appended to the string

	#terminate the loop if valid input was provided
	break if answer == "y" || answer == "n"

end

#analyze the player's input
if answer == "n" #see if the player elected not to take the game

	Console_Screen.cls #clear the display area

	#invite the player to return and play game some other time
    puts "Okay, perhaps another time.\n"

else #the player wants to play the game

	#execute the game class's display_instructions method
	$gameCount = $gameCount + 1
	SQ.display_instructions


	loop do

		#execute the Game class's play_method
		SQ.play_game

		Console_Screen.cls #clear the display area
         print "Game count: " + $gameCount
         print "Average number of guesses: " + $avgNoOfGuesses
		#prompt the player for permission to start a new round of play
		print "Would you like to play again? (y/n): "

		playAgain = STDIN.gets #collect the player's response
		playAgain.chop! #remove any extra characters appended to the string

		break if playAgain == "n" #exit loop

	end

	#call upon the Game class's display_credits method to thank the #player for playingthe game and to display game information
    SQ.display_credits
    

end

#---------------------------------------------------------------------------
#
#
# Script Name: RPS_ExercieE.rb
# Version: 1.0
# Author: Kelvin Penn
# Date: 5/15/2018
# Description: This Ruby game is a computerized version of the classic      # Rock, Paper, Scissors game, in which the player goes head-to-head against
# the computer.
#
#
#
#--------------------------------------------------------------------------

# Define Custome classes---------------------------------------------------
class Screen

	def cls #define a method that clears the display area
		puts ("\n" * 25) #scroll the screen 25 times
		puts "\a" #Make a little noise to get the player's attention
	end
	def pause 
		STDIN.gets #execut the STDIN class's gets method to pause script 
	end

end

#define a class representing the Rock, Paper, Scissors game
class Game
	#this mthod deisplays the game's opeing message
	def display_greeting 

		Console_Screen.cls #clear the diplay area

		#display welcome message
		print "\t\t\tLet's Play Rock, Paper, Scissors!" +
		"\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to " +
		               "continue. "

		Console_Screen.pause #pause the gmae

end

#define a method to be used to resent game instructions
def display_instructions

    puts "This game pits the player against the computer. To play, you must"
    puts "enter one of the following moves when prompted: Rock, Paper, or"
    puts "Scissors.\n\n"
    puts "The game will randomly select a move for the computer, and "
    puts "the two moves will then be analyzed according to the following"
    puts "rules: \n\n"
    puts "* Rock crushes Scissors, Rock equals Rock, and Rock is covered by"
    puts "  Paper.\n\n"
    puts "* Paper covers Rock, Paper equals Paper, and Paper is cut by"
    puts "  Scissors.\n\n"
    puts "* Scissors cut Paper, Scissors equals Scissors, and Scissors are"
    puts "  crushed by Rock.\n\n\n"
    puts "Good luck!\n\n\n"
    print "Press Enter to continue. "
    Console_Screen.pause       #Pause the game

end

#define a method to control game play
def play_game

	Console_Screen.cls #clear the display area

	#call on the method responsible for collecting the
	#player's next move
	playerMove = get_player_move

	#call on the method responsible for generating the computer's move
	computerMove = get_computer_move

	#call on the method responsible for determining the results of the game
	result = analyze_results(playerMove, computerMove)

	#call on the method responsible for displaying the results of the game
	display_results(playerMove, computerMove, result)

end

#define the method responsible for collecting the player's move
def get_player_move

	Console_Screen.cls #clear the display area
    puts "\a"
	loop do #loop forever

		Console_Screen.cls #clear the display area

		#prompt the player to select a move
		puts "To make a move, type one of the following:\n\n"
		print "[R] [P] [S]: "

		@choice = STDIN.gets #collect the player's answer
		@choice.chop! #remove any extra characters appended to string

		#terminate the loop if valid input was provided
		break if @choice =~ /R|P|S/i

			
		end

		#convert the player move to uppercase and return it to the calling 
		#statement
		return @choice.upcase

	end
#define the method responsible for making the computer's move
def get_computer_move

	#define an array containing a list of three possible moves
	moves = ["ROCK", "PAPER", "SCISSORS"]

	#generate and return a random number between 0 and 2
	randomNo = rand(3)

	#return a randomly selected move to the calling statement 
	return moves[randomNo]

end

#define the method responsible for analyzing and returning
#the result of the game (arguments are passed as upper case characters)
def analyze_results(player, computer)

	#analyze the results of the game when the player select ROCK
	if player == "R" then
		
		return "Player wins! Rock Crushes Scissors" if computer == "SCISSORS"
		return "Tie! Rock equals Rock" if computer == "ROCK"
		return "Computer wins! Paper covers Rock" if computer == "PAPER"
	end

	#analyze the results of the game when the player selects PAPER
	if player == "P" then
		return "Player wins! Paper covers Rock" if computer == "ROCK"
		return "Tie! Paper equals paper" if computer == "PAPER"
		return "Computer wins! Scissors cut Paper" if computer == "SCISSORS"
	end

	#analyze the results of the game when the player selects PAPER
	if player == "S" then
		return "Player wins! Scissors cut Paper" if computer == "PAPER"
		return "Tie! Scissors equals Scissors" if computer == "SCISSORS"
		return "Computer wins! Rock crushes Scissors" if computer == "ROCK"
	end

end

#define the method responsible for displaying the result of the game
def display_results(player, computer, result)

	#display arguments pased to the method using the following template
	Console_Screen.cls #clear the display area
	puts "\a"
	puts "\n\n\t\tRESULTS: "
	puts "\n\n\t\t\t=================================================="
	puts "\n\n\t\t\tPlayer's move:   " + player 
	puts "\n\n\t\t\tComputer's move:   " + computer
	puts "\n\n\t\t\tResult:            " + result + " " + $gameCount
	puts "\n\n\t\t\t==================================================="
	puts "\n\n\n\n"
	print "Press Enter to continue. "
	Console_Screen.pause #pause the game

end

#This method displays information about the Rock, Paper, Scissors game
def display_credits

	Console_Screen.cls #clear the display area

	#thank the player and display game information
	puts "\t    Thank you for playing the Rock, Paper Scissors game. "
	puts "\n\n\n\n"
	puts "\n\t\t\t Developed by Kelvin Penn.\n\n"
	puts "\t\t\t\t Copyright 2018\n\n"
	puts "\t\t\tURL: http://www.tech-publishing.com" +

	"\n\n\n\n\n\n\n\n\n\n\n"
end

def game_count
	if playAgain == "y" then
		$gameCount += 1

end
end

end

#Main Script Logic-------------------------------------------------------
$gameCount = 0
$wins = 0
$lost = 0
$ties = 0

Console_Screen = Screen.new #instantiate a new Screen object
RPS = Game.new	#instantiate a new Game object

#execute the Game class's diplay_greeting method
RPS.display_greeting 

answer = "" #initialize variable and assig it an empty string

#loopp until the player enters y or n do not acept any other input
loop do 

	Console_Screen.cls #clear the display area

	#prompt the player for permission to start the game
	print "Are you read to play Rock, Paper, Scissors? (y/n): "

	answer = STDIN.gets #collectthe player's answer
	answer.chop! #remove any extra characters appended to the string

	#terminate the loop if valid input was provided 
	break if answer =~ /y|n/i

end

#analyze the player's answer
if answer =~ /n/i #see if the player wants to quit

	Console_Screen.cls #clear the display area

	#invite the player to return and play the gae some other time
	puts "Okay, perhaps another time.\n\n"

else #the player wants to play the game

	#execute the Game class's display_instructions method
	RPS.display_instructions

	playAgain = ""

	loop do #loop forever

		#execute the Game class's play_game method
		RPS.play_game

		loop do #forever

			Console_Screen.cls #clear the display area

			#find out if the player wants to play another round
			print "Would you like to play again? (y/n): "

			playAgain = STDIN.gets #collect the player's response
			playAgain.chop! #remove any extra characters appended

			#terminate the loop if valid input was provided
			break if playAgain =~ /n|y/i

		end

		#terminate the loop f valid input was provided
		break if playAgain =~ /n/i

	end

	#call upon the Game class's determine_credits method
	RPS.display_credits

end



#---------------------------------------------------------------------------
#
# Script Name: WordGuess.rb
# Version: 1.0
# Author: Kelvin Penn
# Date: May 2018
#
# Description: This Ruby script demonstrates how to work with regular
# expressions through the development of a computer game that challenges
# the player to guess a mystery word after being first allowed to guess
# 5 consonants and 1 vowel
#
#
#
#---------------------------------------------------------------------------


#define custom classes

#define a class representing the console window
class Screen

	def cls #define a method that clears the display area
		puts("\n" * 25) #scroll the screen 25 times
		puts "\a" #make a little noise to get player's attention
	end

	def pause #define a mehtod that pauses  the display area
		STDIN.gets #execute the STDIN class's gets method to pause script 
		           #execution until the player presses the Enter key

		       end

		   end

#define a class representing the Word Guessing Game
class Game

	#this method displays the game's opening message
	def display_greeting

		Console_Screen.cls #clear the display area

		#display welcome message
		print "\t\t\tWelcome to the word Guessing Game!" +
		"\n\n\n\n\n\n\n\n\n\n\n\n\n\nPress Enter to continue."

		Console_Screen.pause #pause the game

	end

#define a method to be used to present game instructions
def display_instructions

	Console_Screen.cls #clear th display area
	puts "Instructions:\n\n" #display a heading

	#display games instructions
	puts "At the start of each round of play, the game randomly selects"
	puts "a word that is between minimum four and max ten characters long and"
	puts "challenges you to guess it. Before submitting your guess, you"
	puts "must specify five consontants and one vowel. If any of these"
	puts "are used in the word, they will be revealed on the screen,"
	puts "thereby making it easier for you to guess the secret word"
	puts "If a letter you chose is not in the word, then its space will " +
	" will be replaced by an underscore (_)\n\n\n"
	puts "Goodluck!\n\n\n\n\n\n\n"
	print "Press Enter to continue."

	Console_Screen.pause #pause the game
end

def select_word

	#define an array of 20 words from which the game will randomly select

	words = ["window", "station", "hamburger", "expression", "wallet", "camera", "airplane", "candle", "computer", "picture", "frame", "shelf", "bowling", "polite", "statement", "negative", "method", "fishing", "compensate", "happy", "office", "game", "blade", "mark",
		"music", "monopoly", "train", "bird", "tarantula", "volcanoe", "octopuse", "century", "seahawk", "dome", "rocker", "stool", "bachelor", "plants", "umbrella", "monkey"]

	#generate and return a random number between 0 and 19
	randomNo = rand(39)

	#return a roandomly selected word to the calling statement
	return words[randomNo]

end

#define a method that collects the player's consonat guesses
def get_consonants

	list = Array.new #define an array in which to store the consonants

	#give the player an idea of what is coming
	puts "Before you try to guess the secret word, you must specify 5 " +
	"consonants. \n\n"
	print "Press Enter to continue."

	Console_Screen.pause #pause the game

	5.times do #iterate 5 times

		Console_Screen.cls #clear the display area

		#prompt the player to enter a consonant
		print "\nPlease enter a consonant and press Enter. "

		input = STDIN.gets #collect the player's input
		input.chop! #remove the end of line marker

		#only accept consonant characters
		if input !~/[bcdfghjklmnpqrstvwxyz]/i then 
			Console_Screen.cls #clear display area
			print "Error: " + input + " is not a consonant." +
			"Press Enter to continue"
			Console_Screen.pause #pause the game
			redo #repeat the current iteration of the loop
		end

		#only accept one character of input per guess
		if input.length > 1 then
			Console_Screen.cls
			print "Error: You may only enter one character at a time" +
			"Press Enter to continue."
			Console_Screen.pause #pause the game
			redo #repeat the current iteration of the loop

		end
        
    #do not allow the player to submit the same guess twice
    if list.include?(input.upcase) == true then
    	Console_Screen.cls #clear the display area
    	print "Error: You have already guessed" + input + 
    	"Press Enter to continue"
    	Console_Screen.pause #pause the game
    	redo #repeat the current iteration of the loop

    else
    	list.push(input.upcase) #convert the consonant to uppercase and add
    	                        #it to the list of consonants
    end
end
    return list #return the list of consonants to the calling statement

end

#define a mehtod that collects the player's vowel guess 
def get_vowel

	#give the player an idea of what is coming
	puts "Before you try ot guess the secret word, you must" +
	     "specify 1 vowel.\n\n"

	1.times do #iterate 1 time

		Console_Screen.cls #clear the display area

		#prompt the player to enter a vowel
		print "\nPlease enter a vowel and press Enter. "
		input = STDIN.gets #collect the player's input
		input.chop! #remove the end of the line marker

		#only accept vowel characters 
		if input !~/[aeiou]/i then
			Console_Screen.cls #clear the diplay area
			print "Error: " + input + " is not a vowel." +
			"Press Enter to continue."
			Console_Screen.pause 
			redo #repeat the current iteration of the loop

		end
        
        #only accept one character of input per guess
        if input.length > 1 then
        	Console_Screen.cls #clear the display area
        	print "Error: You may only enter one character" +
        	"at a time. Press Enter to continue."
        	Console_Screen.pause #pause the game
        	redo #repeaat the current iteration of the loop

        end

        input = input.upcase #convert the vowel to uppercase 
        return input #return vowel to the calling statement 

    end

end

#define a method that collects player guesses
def prompt_for_guess(shortWord, word, consonants, vowel)

	Console_Screen.cls #clear the display area

	consonants.push(vowel) #to make things easy, add the vowel to the list 
	                       #of consonanats
    wordArray = word.split(" ") #split the secret word into an array

    i = 0 #initialize index variable to zero

    #loop once for each letter in the word (stored in an array)
    wordArray.each do |letter|

    	match = false #initial the variable with a string value of false

    	#loop once for each consonant stored in the consonants array
    	consonants.each do |character|

    		#compare the current character from the consonants
    		#array to the current letter in the wordArray array
    		if character == letter then
    			match = true #set variable value to indicate a match
    			break #terminate loop execution whe a match occurs
    		end

    	end

    	#if there is no matching character in the consonants
    	#array for the current letter in the wordArray
    	#array, replace that letter in the wordArray with 
    	#an underscore chracter
    	if match == false then
    		wordArray[i] = "_" #replace the current character withunderscore
    	end

    	i = i + 1 #increment the variable's value by 1

    end

    #once the contents of the array hve been formatted with underscores
    #convert the contents of the array back into a word
    word = wordArray.join(" ")

    #allow the player up to three guesses
    3.times do |i| #i equals 0 on the first iteration of the loop

    	Console_Screen.cls #clear the display area

    	#prompt the player to try to guess the secret word
    	puts "I am thinking of a word.\n\n\n\n\n"
    	print "Here is your clue: " + word + "\n\n\n\n\n\n\n\n"
    	print "What do you think this word is? "
    	reply = STDIN.gets #collect the player's reply
    	reply.chop! #remove the end of line marker
    	reply = reply.upcase #convert the reply to all uppercase

    	#analyze the player's guess
    	if reply == shortWord then #the player guessed the secret word

    		Console_Screen.cls print "Correct! Press Enter to continue"
    		Console_Screen.pause #pause the game
    		break #terminate the execution of the loop

    	else #the player did not guess the secret word

    		Console_Screen.cls #clear the display area

    		#display a message based on how many turns remain
    		if i == 1 then
    			print "Wrong! You have one guess left. Press Enter to " +
    			"try again."

    		elsif i == 2 
    		print "Sorry, you lose.\n\n"
    		print "The word was " + shortWord.capitalize + " Press Enter to continue."
    	else
    		print "Wrong! Press Enter to try again."
    	end

    	Console_Screen.pause #pause the game
    end
end
end

#define a method to control game play 
def play_game

	word = select_word #call on the method that retrievess a random word

	Console_Screen.cls #clear the display area

	consonants = get_consonants #call on the method that prompts the player
	#to enter a list of consonatns

	Console_Screen.cls #clear the display area

	#call on the method that prompts the player to enter a vowel
	vowel = get_vowel

	#remove blank spaces from the word to create a short version of the word
	shortWord = word.gsub(" ", "")

	#call the method that processes palyer guesses
	prompt_for_guess(shortWord, word, consonants, vowel)

	Console_Screen.cls #clear the display area

end

#this method displays the information about the Word Guessing game
def display_credits

	Console_Screen.cls #clear the display area 

	#thanks the player and siplay game information
	puts "\t\t    Thank you for playing the Word Guessing Game. \n\n\n"
	puts "\n\t\t\t Developed by Kelvin Penn\n\n"
	puts "\t\t\t\t Copyright 2010\n\n"
	puts "\t\t\tURL: httyp://www.tech-publishing.com\n\n\n\n\n\n\n\n"

end
end
#Main Script Logic--------------------------------------------------------

Console_Screen = Screen.new #instantiate a new Screen object
WordGuess = Game.new

#execute the Game class's display_greeting 
WordGuess.display_greeting

answer = "" #initialize variable and assign it an empty string

#loop until the player enters y, n, Y, or N and do not accept any other #input

loop do
	Console_Screen.cls #clear the display area

	#prompt the player for permission to start the game
	print "Are you ready to play the Word Guessing Game? (Press H to view Instructions) (y/n): "

	answer = STDIN.gets #collect the player's answer
	answer.chop! #remove the new line character appended to the string
    
    if answer =~ /H/i then
    	WordGuess.display_instructions
	#terminate the loop if valid input was provided
	break if answer =~ /y|n/i #accept uppercase or lowercase input

end

#analyze the player's input
if answer == "n" or answer == "N" #see if the player elected not to play game

	Console_Screen.cls #clear the display area

	#invite the player to return and play the game some other time
	puts "Okay, perhaps another time.\n\n"

else #the player wants to play the game

	loop do #loop forever

		#execute the Game class's play_game method
		WordGuess.play_game

		#find out if the player wants to play another round
		print "Enter Q to quit or press any key to play again (Press H to view instructions): "

		playAgain = STDIN.gets #collect the player's response
		playAgain.chop! #remove the new line character appended to the #string
        if playAgain =~ /H/i then
        	WordGuess.display_instructions

        end
		#terminate the loop if valid input was provided
		break if playAgain =~ /Q/i

	end

	#call upon the Game class's display_credits method
	WordGuess.display_credits

end
end




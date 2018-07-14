#---------------------------------------------------------------------------
#
# Script Name: BlackJarck.rb
# Version: 1.0
# Author: Kelvin Penn
# Date: April 2010
#
# Description: This ruby game is a computerized version of the casino card 
# game in which the player competes against the dealer (i.e., computer) in
# an effor to build a hand that comes as close as possible to 21 without
# going over
#
#--------------------------------------------------------------------------

#define a class representin the console window
class Screen

	def cls #define a method that clears the display area
		puts ("\n" * 25) #scroll the screen 25 times 
		puts "\a" #make a little noise to get the player's attention

	end

	def pause #define a method that pauses the display area
		STDIN.gets #execute the STDIN class's gets method to pause the 
		           #script execution until player presses Enter
		       end
		   end

#define a class representin the Ruby Blackjack game
class Game

	def get_file(filename)

		if filename == "Help" then
			retrieve_files("Help")

		elsif filename == "Welcome"
			retrieve_files("Welcome")
		
		elsif filename == "Credits"
			retrieve_files("Credits")
		end

		Console_Screen.pause
				
		end

	def retrieve_files(pickfile)
	if pickfile == "Help" then
		$help_file = File.read("BJHelp.txt")
		puts $help_file
	
	elsif pickfile == "Welcome" then
		$welcome_file = File.read("BJWelcome.txt")
		puts $welcome_file
	
	elsif pickfile == "Credits" then
		$credits_file = File.read("BJCredits.txt")
		puts $credits_file
	end

end

		
			
						

	
#define a method to be used to display game instructions
	
	#define a method to control game play
	def play_game

		Console_Screen.cls #clear the display area

		#give the player and dealer an initial starting card
		playerHand = get_new_card
		dealerHand = get_new_card

		#call the method responsible for dealing new cars to the player
		playerHand = complete_player_hand(playerHand, dealerHand)

		#if the player has not busted, call the method
		if playerHand <= 21 then 
			dealerHand = play_dealer_hand(dealerHand)
		end

		#call the method responsible for determining the results
		determine_winner(playerHand, dealerHand)

	end

	def write_log_file(type)

		if RUBY_PLATFORM =~ /win32/ then
			outFile = File.new('C:\temp\BJLog.txt', "a")
			outFile.puts type
			outFile.close

		else
			outFile = File.new('tmp/BJLog.txt', "a")
			outFile.puts type
			outfile.close
		end
	#define a method responsible for dealing a new card
	
	def get_new_card

		#assign a random number from 1 to 13 as the value of the card 
		#being created
		card = 1 + rand(13)

		#a value of 1 is an ace, so reassign the card value of 11
		return 11 if card == 1

		#a value of 10 or more equals a face card so reassign the card
		#a value of 10
		return 10 if card >= 10

		return card #return the value assigned to the new card

	end

	#define a method responsible for dealing the rest of the player hand
	def complete_player_hand(playerHand, dealerHand)

		loop do #loop forever
			Console_Screen.cls #clear the display area

			#show the current state of the player's and dealer's hands
			puts "Player's hand: " + playerHand.to_s + "\n\n"
			puts "Dealer's hand: " + dealerHand.to_s + "\n\n\n\n\n"

			print "Would you like another card (y/n) "

			reply = STDIN.gets #collect the player's answer
			reply.chop! #remove any extra characters appended
						#to the string

			#see if the player decided to ask for another card
			if reply =~ /y/i then
				#call method responsible to the player's hand
				playerHand = playerHand + get_new_card
			end

			#see if the player has decided to stick with the current hand
			if reply =~ /n/i then
				break #terminate the execution of the loop
			end

			if playerHand > 21 then 
				break #terminate the execution of the loop
			end
		end

		#return the value of the player's hand
		return playerHand

	end

	#defin a method responsible for managing the dealer's hand
	def play_dealer_hand(dealerHand)

		loop do #loop forever

			#if the alue of the dealer's hand is less than 17
			#then give the dealer another card
			if dealerHand < 17 then
				#call method responsible for getting a new card
				#and add to dealer's hand
				dealerHand = dealerHand + get_new_card
			else
				break #terminate the execution of the loop 
			end

		end

		#return the value of the dealer's hand
		return dealerHand

	end

	#define a method responsible for analying the player's and dealer's 
	#hands and determining who won
	def determine_winner(playerHand, dealerHand)

		Console_Screen.cls #clear the display area

		#show the value of the player's and dealer's hands
		puts "Player's hand: " + playerHand.to_s + "\n\n"
		puts "Dealer's hand: " + dealerHand.to_s + "\n\n\n\n\n\n\n"
		write_log_file("Player's hand: " + playerHand.to_s)
		write_log_file("Dealer's hand: " + dealerHand.to_s)
		
		if playerHand > 21 then #see if the player has busted
			puts "You have gone bust!\n\n"
			print "Press Enter to continue."
		else #see if the player and dealer have tied
			if playerHand == dealerHand then
				puts "Tie!\n\n"
				print "Press Enter to continue"
			end
			#see if dealer has busted
		if dealerHand > 21 then
			puts "The Dealer has gone bust!\n\n"
			print "Press Enter to continue."
		else
			#see if the player's hand beats the dealer's hand
			if playerHand > dealerHand then
				puts "You have won!\n\n"
				print "Press Enter to continue"
			end
			#see if the dealer's hand beats the player's hand
			if playerHand < dealerHand then
				puts "The Dealer has won!\n\n"
				print "Press Enter to continue."
			end
		end
		end

		Console_Screen.pause #pause the game

	end
end

#Main Script Logic--------------------------------------------------------

Console_Screen = Screen.new #instantiate a new Screen object

BJ = Game.new #instantiate a new Game object

#execute the Game class's display_greeting method
BJ.display_greeting

answer = "" #initialized variable and assign it an empty string

#loop until the player enters y or n and nothing else
loop do
	Console_Screen.cls #clear the display area

	#prompt the player for permission to start the game
	print "Are you ready to play Ruby Blackjack? (y/n): "

	answer = STDIN.gets #collect the player's answer
	answer.chop! #remove any extra characters appended to string

	#terminate the loop if valid input was provided
	break if answer =~ /y|n/i #accept upercase and lowercase input

end

#analyze the player's answer
if answer =~ /n/i #see if player wants to quit

	Console_Screen.cls #clear display area

	#invite the player to return and play the game soe other time
	puts "Okay, perhaps another time.\n\n"

else #player wants to play game

	#execute the Game class's display_instructions method
	BJ.get_file

	playAgain = "" #initialized variable and assign it an empty string

	loop do #loop forever

		#execute the Game class's play_game method 
		BJ.play_game

		loop do #loop forever

			Console_Screen.cls #clear the display area
			#find out if player wants to play another round
			print "Would you like to play another hand? (y/n): "

			playAgain = STDIN.gets #collect the player's respons

			playAgain.chop! #remove any extra characters appended

		    #terminate loop if valid input was provided
		    break if playAgain =~ /n|y/i #accept uppercase and lowercase

		end

		#terminate the loop if valid input was provided
		break if playAgain =~/n/i

	end

	#call upon the Game class's display_credits method
	BJ.display_credits

end
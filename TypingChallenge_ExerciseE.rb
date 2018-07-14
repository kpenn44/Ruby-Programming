#----------------------------------------------------------------------------
#
# Script Name:	TypingChallenge.rb
# Version:		1.0
# Author:		Kelvin Penn
# Date:			April 2010
# 
# Description: This Ruby script demonstrates how to apply conditional
# 			   logic in order to analyze user input and control script
#			   execution through the development of a computer typing
#			   test that evauluates the player's typing skills.
#
#----------------------------------------------------------------------------

#Define a class representing the console window
class Screen


  def cls #define a method that clears the display area
  	puts ("\n" * 5) #scroll the screen 25 times
  	puts "\a" #make a little noise to get the player's attention

  end

 def pause #Define a method that pauses the display area
 	STDIN.gets #execute the STDIN class's gets method to pause script executioin #until the player presses the Enter key

 end

#define a class representing the typing test
class Test
  #This method displays the Typing Challenge greeting message
  def display_greeting

  Console_Screen.cls #clear the diplay area

  #display a welcome screen
  print "\t\t Welcome to the Ruby typing challenge game! \n\n\n\n\n\n\n Press Enter to continue. \n\n" 
  Console_Screen.pause #pause the game
end

#define a method to be used to present test instructions 
def display_instrutions

	Console_Screen.cls #clear the display area
	puts "\t\t\tInstructions: \n\n" #display a heading

	#display the game's instrutions
	puts %Q{ This test consists of a series of 10 typing challenges. The challenge sentences are presented one at a time. To respond correctly, you must retype each sentence exactly as shown and press the Enter key. You receive an A if you get 9 or 10 right, a B if you get 8 right, a C if you get 7, a D if you get 6 and F for anything 5 or below. Happy gaming. \n\n\n\n\n\n Press Enter to continue.\n\n}

	Console_Screen.pause
end

#define a method to be used to present typing challenges
def present_test(challenge)

	Console_Screen.cls #clear the display area
	print challenge + "\n\n: " #display the challenge sentence
	result = STDIN.gets #collect the player's input
	result.chop! #remove the end of line marker

	#analyze the player input and see if it is correct
	if challenge == result then

	#keep track of the number of corretly retyped challenge sentences 
	$noRight += 1
	Console_Screen.cls #clear the display area
	#keep player informed
	print "Correct!\n\nPress Enter to continue."
	Console_Screen.pause #pause the game

else 

	Console_Screen.cls #clear the diplay area
	#keep the player informed
	print "Incorrect!\n\nPress Enter to continue"
	print " Correct sentence: " + challenge.to_s + "\tYour sentence: " + result.to_s 
	Console_Screen.pause #clear the game

until result != " "

	Console_Screen.cls #clear the diplay area
    
    #prompt the playwer for permission to bein the test
    print "You have to type something "

    result = STDIN.gets #collect the player's response 
    result.chop! #remove any extra characters appended to the  string	
end
end
end

#define a method to be used to display test results 
def determine_grade

	Console_Screen.cls #clear the display area

	#to pass the test the player must corretly retype 3 sentences

	case 

	when ($noRight == 10 || $noRight == 9)
		puts "Congrats you received an A!"
	when ($noRight == 8)
		puts "You got a B!"
	when ($noRight == 7)
		puts ("Okay, you got a C! Not bad!")
	when ($noRight == 6)
		puts ("You got a D, try harder!")
	when ($noRight <= 5)
		puts ("You got an F bud.")
		
	

	end

end

#Main Script Logic--------------------------------------------------------------

#Initialized global variable that will be used to keep track of the number of 
$noRight = 0

Console_Screen = Screen.new #instantiate a new screen object
Typing_Test = Test.new #Instantiate a new test object

#execute the Test object's display greeting method 
Typing_Test.display_greeting 

#execute the Screen object's cls method in order to clear the screen
Console_Screen.cls

#prompt the player for permisssion to begin the test
print "Would you like to test your typing skills? (y/n)\n\n: "

answer = STDIN.gets #collect the plyaer's response
answer.chop! #remove any extra characters appended to the string

#loop until the player enters y or n and do not accept any other input
until answer == "y" || answer == "n"

	Console_Screen.cls #clear the diplay area
    
    #prompt the playwer for permission to bein the test
    print "Would you like to test your typing skills? (y/n)\n\n: "

    answer = STDIN.gets #collect the player's response 
    answer.chop! #remove any extra characters appended to the  string

end

#analyze the player's response
if answer == "n" #see if the player elected not to play

	Console_Screen.cls #clear the display area
	#invite the player to return and play again
	puts "Okay, perhaps another time.\n\n "

else # the player wants to take the test
	Console_Screen.cls #clear the displa

	#execute the Test objet's diplay instructions method
	Typing_Test.display_instrutions

	#display typing challenges and grade each answer by calling on the test #object's present_test method

	Typing_Test.present_test "In the end there can be only one."
	Typing_Test.present_test "Once a great plague swept across the land."
	Typing_Test.present_test "Welcome to the Principles of Ruby programming."
	Typing_Test.present_test "There are very few problems in the world that enough M&Ms cannot fix."
	Typing_Test.present_test "Perhaps today is a good day to die. Fight beside me and let us die together."
	Typing_Test.present_test "Ask me to marry you and I will love you forever."
	Typing_Test.present_test "Can you keep a secret at all Helen? This is just absoloutely ridiculous."
	Typing_Test.present_test "I'm with stupid."
	Typing_Test.present_test "If you listen closely to a sea shell, you can definitely hear the waves."
	Typing_Test.present_test "What if I told you it was magic bro."


	#notify the player of the results by executing the Test object's determine_grade method
	Typing_Test.determine_grade

	Console_Screen.pause #pause the game

	Console_Screen.cls #clear the diplay area thank the player for taking the #typing test
	puts "Thank you for taking the Ruby Typing Challenge.\n\n"
  end

end
end

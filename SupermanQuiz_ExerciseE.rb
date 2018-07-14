#----------------------------------------------------------------------------
#Script Name: SupermanQuiz.rb 
#Version: 1.0
#Author: Kelvin Penn
#Date: April 2018
#Description: This Ruby script demonstrates how to work with loops when #collecting user input through the creation of an interactive quiz that #evaluates the player's knowledge of the Superman movie series.
#
#----------------------------------------------------------------------------
class Screen

def cls #define a method that clears the diplay area
	puts ("\n" * 25) #scroll the screen 25 times
	puts "\a" #make a little noise to get the player's attention

end

def pause #define a method that pauses the diplay area

STDIN.gets #execute the STDIN class's gets method to pause script #execution until the player presses the Enter key

end


#define a class representing the Superman Movie Trivia Quiz class Quiz
class Quiz

	#this method displays the quizs opening screen 
	def display_greeting
		Console_Screen.cls #clear the diplay area

		#display welcome message
		print "\t\t Welcome to the Superman Movie Trivia Quiz! \n\n\n" + "Press Enter to continue"
		Console_Screen.pause #pause the game

end

#define a method to be used to present quiz instructions 
def display_instructions

	Console_Screen.cls #clear the display area
	puts "INSTRUCTIONS:\n\n" #display a heading

	#display the game's instructions
	puts "You will be presented with a series of multiple choice  questions. To answer question, type in the letter of the corresponding answer and press the Enter key. Your grade will be displayed at the end of the test.\n\n\n"
	puts "Godd luck!\n\n\n\n\n\n\n\n"
	print "Press Enter to continue or press g to view grade scale."

	Console_Screen.pause #pause the game
	scale = STDIN.gets
	scale.chop!
end
end

def disp_scale

	Console_Screen.cls

	print "The grading scale is as follows: "
	puts "10 = Super Hero"
	puts "8 - 9 = Side Kick"
	puts "6 - 7 = Good Citizen"
	puts "5 or below is a fail"
end
end
#define a method to be used to present and process quiz questions
def disp_q(question, q_A, q_B, q_C, q_D, answer)

	#loop until the player inputs a valid answer
	loop do 
		Console_Screen.cls #clear the display area

		#format the display of the quiz question
		puts question + "\n\n"
		puts q_A
		puts q_B
		puts q_C
		puts q_D

		print "\nType the letter representing your answer: "

		reply = STDIN.gets #collect the player's anser
		reply.chop! #remove the end of line marker

		#analyze the player's input to determine if it is correct
		if answer == reply then

			#keep track of the number of correctly answered questions
			$noRight += 1
		
	end

	#analyze the answer to determine if it was valid
	if reply == "a" or reply == "b" or reply == "c" or reply == "d" then

		break #terminate the execution of the loop

	end
end
end

#define a method to be used to grade and display quiz results
def determine_grade

	Console_Screen.cls #clear the display area

	#topass the test, the player must correctly answer at least 3 questions 
	if $noRight >= 6 then

		#infrom the player of the good news and assign a ranking
		print "You correctly answered " + $noRight.to_s + " question(s)"
		puts "You have passed the \n Superan Movie Trivia Quiz!\n\n"
		puts "You have earned a rank of: Good Citizen" if $noRight >= 6 &&
		$noRight < 8
		puts "You have earned a rank of: Side Kick" if $noRight >= 8 &&
		$noRight < 10
		puts "You have eanred a rank of: Super Hero" if $noRight == 10
		print "\n\nPress Enter to continue."

	else #the player has failed the quiz

		#inform the player of the bad news
		
		print "You missed " + (10 - $noRight).to_s + "questions."
		puts "You have failed the Superman Movie Trivia Quiz."
		puts "Perhaps you should watch the movies again before returning to take the quiz"
		puts "This URL is to the wikipedia page for the movies  http://en.wikipedia.org/wiki/ Superman_movies" 
		print "\n\nPress Enter to continue"

	end

	Console_Screen.pause #pause the game

end

#this method displays the information about the Superman Movie Trivia Quiz
def display_credits

	Console_Screen.cls

	#thank the player and display game information
	puts "\t\tThank you for taking the Superman Movie Trivia Quiz.\n\n\n\n"
	puts "\n\t\t\t\t Developed by Kelvin Penn.\n\n"
	puts "\t\t\t\t Copyright 2011\n\n"
	puts "\t\t\t URL: http://www.tech-publishing.com\n\n\n\n\n\n\n\n\n"

end
end
#Main Script Logic ---------------------------------------------------

#intialize global variable that will be used to keep track of the #number of correctly answered quiz questions
$noRight = 0


Console_Screen = Screen.new #instantiate a new Screen object
SQ = Quiz.new #instantiate a new Quiz object

#execute the Quiz class's display_greeting method 
SQ.display_greeting

answer = ""

loop do

	Console_Screen.cls #clear the display area

	#prompt the player for permission to start the quiz
	print "Are you ready to take the quiz? (y/n): "

	answer = STDIN.gets #collect the player's response
	answer.chop! #remove one character from the end of the string

	break if answer == "y" || answer == "n"

end

#analyze the player's input
if answer == "n" #see if the player elected not to take the quiz

	Console_Screen.cls #clear the display area

	#invite the player to return and take the quiz some other time
	puts "Okay, perhaps another time.\n\n"
	SQ.display_credits

else #the player wants to take the quiz

	#execute the Quiz class's display_instructions method

SQ.display_instructions

#execute the Quiz class's disp_q method and pass it arguments representing 
#a question, possible ansers and the letter of the correct answer

SQ.disp_q("What is the name of the Daily Planet's Ace photographer?", 
	"a. Jimmy Olsen", "b. Clark Kent", "c. Lex Luthor", "d. Lois Lane","a")

#call upon the disp_q method and pass it the second question
SQ.disp_q("What is the name of Clark Kent's home town?", "a. Metropolis", 
	"b. Gotham City", "c. Smallville", "d. New York", "c")

#call upon the disp_q method and pass it the third question
SQ.disp_q("In which movie did Superman battle General Zod?", 
	"a. Superman", "b. Superman II", "c. Superman III", "d. Superman IV", 
	"b")

#call upon the disp_q method and pass it the fourth question
SQ.disp_q("What is the name of Superman's father?", "a. Nino", "b. Jarrell",
	"c. Lex Luthor", "d. Krypton", "b")

#call upon the disp_q method and pass it the fifth question
SQ.disp_q("Where had Superman been at the start of 'Superman Returns'?",
	"a. Moon", "b. Fortress of Solitude", "c. Earth's Core", "d. Krypton",
	"d")
SQ.disp_q("What is Superman's weakness?", "a. metal", "b. kryptonite",      "c. diamonds", "d. lasers", "b")
SQ.disp_q("Who is Superman's mortal enemy?", "a. Lex Luther", "b. Lois Lane", "c. Spiderman", "d. the People", "a")
SQ.disp_q("What color is Superman's cape", "a. black", "b. green", "c. orange", "d. red", "d")
SQ.disp_q("Who is Clark Kent really?", "a. Batman", "b. Superman", "c. My neighbor", "d. Your neighbor", "b")
SQ.disp_q("Who is the actor that played Superman?", "a. George Clooney", "b. Idris Elba", "c. Christopher Reeves", "d. Michael Jackson", "c")
#call upon the Quiz class's determine_grade method to display the player's grade and assigned rank
SQ.determine_grade


#call upon the Quiz class's display_credits method to thank the player for taking the quiz and to display game info
SQ.display_credits

end

if $noRight < 6

	Console_Screen.cls

	puts "Do you want to retake it? (y/n)"
	retake = STDIN.gets
	retake.chop!
end

if retake == "y"


SQ.disp_q("What is the name of the Daily Planet's Ace photographer?", 
	"a. Jimmy Olsen", "b. Clark Kent", "c. Lex Luthor", "d. Lois Lane","a")

#call upon the disp_q method and pass it the second question
SQ.disp_q("What is the name of Clark Kent's home town?", "a. Metropolis", 
	"b. Gotham City", "c. Smallville", "d. New York", "c")

#call upon the disp_q method and pass it the third question
SQ.disp_q("In which movie did Superman battle General Zod?", 
	"a. Superman", "b. Superman II", "c. Superman III", "d. Superman IV", 
	"b")

#call upon the disp_q method and pass it the fourth question
SQ.disp_q("What is the name of Superman's father?", "a. Nino", "b. Jarrell",
	"c. Lex Luthor", "d. Krypton", "b")

#call upon the disp_q method and pass it the fifth question
SQ.disp_q("Where had Superman been at the start of 'Superman Returns'?",
	"a. Moon", "b. Fortress of Solitude", "c. Earth's Core", "d. Krypton",
	"d")
SQ.disp_q("What is Superman's weakness?", "a. metal", "b. kryptonite",      "c. diamonds", "d. lasers", "b")
SQ.disp_q("Who is Superman's mortal enemy?", "a. Lex Luther", "b. Lois Lane", "c. Spiderman", "d. the People", "a")
SQ.disp_q("What color is Superman's cape", "a. black", "b. green", "c. orange", "d. red", "d")
SQ.disp_q("Who is Clark Kent really?", "a. Batman", "b. Superman", "c. My neighbor", "d. Your neighbor", "b")
SQ.disp_q("Who is the actor that played Superman?", "a. George Clooney", "b. Idris Elba", "c. Christopher Reeves", "d. Michael Jackson", "c")
#call upon the Quiz class's determine_grade method to display the player's grade and assigned rank
SQ.determine_grade


#call upon the Quiz class's display_credits method to thank the player for taking the quiz and to display game info
SQ.display_credits

end

if retake == "n"
 SQ.display_credits

end
end



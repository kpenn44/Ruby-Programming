puts "What year did you graduate high school?"
answer = STDINgets
answer.chop!

 

when (answer <= 1990)
	puts "Okay, you're kind of old"
when (answer >= 2000)
	puts "Your very novice"
when (answer == 2010)
	puts "That was a great year to graduate"
	
end
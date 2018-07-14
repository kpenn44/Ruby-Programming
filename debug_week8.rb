puts "Would you like to know your fortune? (y/n) "
input = STDIN.gets
input.chop!

ifinput == "y" then
	puts "What is your favorite number?"
	answer = STDINgets
	answer.chop!
end

if answer % 2 == 1  then
	puts "You're going to have an odd one today"
else 
	puts "Your day will be even kilt"


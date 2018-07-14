$dogs = 15
$cats = 12
$other = 13


puts "What kind of Animal(s) are you bringing in today? "
result  = STDIN.gets
result.chop!



if result ~/dogs/i then

	puts "How many dogs? "
	answer = STDIN.gets
	answer.chop!

	puts "Your price will be " + ($dogs * answer).to_i + "for the day"


elsif result ~/cats/i then

	puts "How many cats? "
	answer = STDIN.gets
	answer.chop!

	puts "Your price will be " + ($cats * answer).to_i + "for the day"

else

	puts "How many other types of animals are you bringing"
	answer = STDIN.gets
	answer.chop!

	puts "Your price will be " + ($other * answer).to_i + "for the day"

end

return answer
end
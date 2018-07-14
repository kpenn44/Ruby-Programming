print "Enter an even number between 1 and 10: "
number = STDIN.gets
number.chop!

if input =~ /[2468]/ then
	puts "Yes that is an even number"
end



else
	puts "That was not an even number buddy"

end
onTime = 9
late = 12

puts "What time did you get to the function?"

arrival = STDIN.gets
arrival.chomp!

if arrival <= 8
   "You arrived before admission bumps up, your price is #{onTime}"
else 
  put "It's after 8. Your price is #{late}
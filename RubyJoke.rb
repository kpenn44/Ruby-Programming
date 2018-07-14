#
#Script Name: RubyJoke.rb
#Version: 1.0
#Author: Kelvin Penn
#Description: This program tells a series of jokes
#

class Screen 
  def cls
    puts ("/n" * 25)
  end
end

Console_Screen = Screen.new
Console_Screen.cls

puts "Would you like to hear a few funny jokes? (y/n)"
answer = STDIN.gets
answer.chop!

if answer == "n"
  Console_Screen.cls
  puts "Sorry to hear that. Please return and play again soon"

else
Console_Screen.cls

puts "What is black and white and red all over? (Press Enter)"
pause = STDIN.gets

puts "A messy penguin eating cherry pie! (Press Enter)"
pause = STDIN.gets

Console_Screen.cls
puts "What is black and white and red all over (Press Enter)"
pause = STDIN.gets

puts "A Sunburned penguin! (Press Enter)"
pause = STDIN.gets

Console_Screen.cls

puts "What is black and white and red all over? (Press Enter)"
pause = STDIN.gets

puts "An embarrased Dalamatian puppy! (Press Enter)"
pause = STDIN.gets

Console_Screen.cls

puts "What is balck and white and red all over? (Press Enter)"
pause = STDIN.gets

puts "A zebra with a scratched knee! (Press Enter)"
pause = STDIN.gets

Console_Screen.cls

puts "What is black and white and red all over? (Press Enter)"
pause = STDIN.gets

puts "A skunk with a diaper rash! (Press Enter)"
pause = STDIN.gets

Console_Screen.cls
puts "Thanks for paying the Ruby Joke game!"

end




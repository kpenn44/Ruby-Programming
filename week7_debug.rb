class LapTop
	attr_accessor :Macbook, :Toshiba, :HP
	def Greeting
		puts "What kind of laptop are you looking for?"
		input = STDIN.gets
		input.chop!
	end

	if input =~ /Macbook/i then
		puts "We have that in stock!"
	elseif input =~ /Toshiba/i then
		puts "I can check the back for you..."
    elsif input = /HP/i then
    	puts "We may be sold out..."
    else
    	puts "These are the three we carry currently..."

    end
end


		
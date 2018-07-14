#----------------------------------------------------------------------
# Debug program for week 8 
# Bellevue UNiversity
# Server side scripting with Ruby on Rails
# 
#----------------------------------------------------------------------

#Verify if "BJCredits" is found in the Ruby System
if File.exist?("BJCredits.txt") then
   puts "\n\nTestDirectory folder found.\n\n"
   
else 
  puts "Test file not found"
  
end

#Verify if it is a folder or something else
if File.directory?("BJCredits.txt") then
   puts "It's a folder."
else 
   puts "It is something else."
end

#Create and write down in a file
out_file = File.new("Quotes1.txt", "w")

out_file.puts("The biggest risk is not taking any risk.....\n\n" +
              "In a world that changing really quickly,\n\n" +
              "the only strategy that is guaranteed to fail\n\n" +
              "is not taking risks.\n\n" +
              "Mark Zuckerberg." )
              
              




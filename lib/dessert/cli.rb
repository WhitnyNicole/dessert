class Dessert::CLI 
  
  def start #instance method
    puts "Welcome to the Protein Bakery"
    puts "What type of dessert would you like?"
    puts "Cookies, Brownies, Blondies, Minis?"
    puts "Type the number of your choice"
    input = gets.strip.downcase
    puts input
    case input #case statement 
      when "cookies"
        puts "you selected cookies"
      when "brownies" 
        puts "you selected brownies"
      when "blondies"
        puts "you selected blondies"
      when "minis"
        puts "you selected minis"
      when "exit"
        puts "Goodbye"
      else
        puts "Invalid"
    end 
  end 
  
end 
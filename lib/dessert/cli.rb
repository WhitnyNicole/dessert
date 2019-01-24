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
        #scrape the cookies page
        #how to call the scraper method 
        url = "https://proteinbakery.com/collections/cookies"
        Dessert::Scraper.scrape_categories(url)
      when "brownies" 
        puts "you selected brownies"
        #scrape the brownies page
        #url https://proteinbakery.com/collections/brownies
      when "blondies"
        puts "you selected blondies"
        #scrape the blondies page
        #url https://proteinbakery.com/collections/blondies
      when "minis"
        puts "you selected minis"
        #scrape the minis page
        #url https://proteinbakery.com/collections/minis
      when "exit"
        puts "Goodbye"
      else
        puts "Invalid"
    end 
  end 
  
end 
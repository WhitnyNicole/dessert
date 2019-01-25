#cli is the only place that talks to the user 

class Dessert::CLI 
  
  def start #instance method
    puts "Welcome to the Protein Bakery"
    puts "What type of dessert would you like?"
    puts "Cookies, Brownies, Blondies, Minis?"
    puts "Type the name of your choice"
    input = gets.strip.downcase
    puts input
    case input #case statement 
      when "cookies"
        puts "you selected cookies"
        #scrape the cookies page
        url = "https://proteinbakery.com/collections/cookies"
        #how to call the scraper method 
        categories = Dessert::Scraper.scrape_categories(url)
        puts categories[0] 
        # puts categories[0].url 
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
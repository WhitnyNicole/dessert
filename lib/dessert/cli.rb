#cli is the only place that talks to the user 

class Dessert::CLI 
  
  def start #instance method
    puts "Welcome to NBA.com"
    puts "What type information would you like?"
    puts "Team, next, next, next?"
    puts "Type the item of your choice"
    input = gets.strip.downcase
    puts input
    case input #case statement 
      when "team"
        puts "These are the NBA teams: "
        #scrape the teams page
        url = "http://www.nba.com/teams"
        #how to call the scraper method 
        categories = Dessert::Scraper.scrape_categories(url)
        puts categories 
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
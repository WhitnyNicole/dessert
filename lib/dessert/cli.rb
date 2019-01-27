#cli is the only place that talks to the user 

class Dessert::CLI 
  
  def start #instance method
    puts "Welcome to NBA.com"
    puts "What type information would you like?"
    puts "Team, Schedule, Standings?"
    puts "Type the item of your choice"
    input = gets.strip.downcase
    puts input
    case input #case statement 
      when "team"
        puts "These are the NBA teams: "
        #scrape the teams page
        url = "http://www.nba.com/teams"
        #how to call the scraper method 
        Dessert::Scraper.scrape_categories(url)
        categories = Dessert::Category.all
        
        puts "Choose the team you want more information on"
        puts categories[0].name
        puts categories[0].url 
      when "schedule" 
        puts "you selected schedule"
        #scrape the schedule page
        #url https://stats.nba.com/schedule/
      when "standings"
        puts "you selected standings"
        #scrape the standings page
        #url http://www.nba.com/standings#/
      when "exit"
        puts "Goodbye"
      else
        puts "Invalid"
    end 
  end 
  
end 
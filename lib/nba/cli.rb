#cli is the only place that talks to the user 

class NBA::CLI 
  
  def start #instance method
    puts "Welcome to the NBA.com!".colorize(:blue)
    menu
  end 
  
  def menu
    puts "\nWould you like to see the current teams?".colorize(:blue)
    puts "\nPlease type yes or exit".colorize(:red)
    input = gets.strip.downcase
    case input #case statement 
      when "yes"
        puts "\nThese are the current NBA teams: ".colorize(:blue)
        scrape_teams
        list_teams
        choose_team
      when "exit"
        puts "\nGoodbye".colorize(:blue)
      else
        puts "\nSorry, I didn't understand that input".colorize(:blue)
        menu
    end 
  end 
  
   def list_teams
        NBA::Team.all.each.with_index(1) do |team, index|
          puts "#{index}. #{team.name}"  #printing out the team names
      end 
    end 
      
   def choose_team
     puts "\nChoose a team by selecting a number 1-30:".colorize(:blue) #adding a line break by using \n
     input = gets.strip.to_i #strip removes whitespace on both sides
     max = NBA::Team.all.length
     if input.between?(1,max)
       team = NBA::Team.all[input-1]
      # puts "\nThese are the players for the #{team.name}: "
       display_team_players(team)
     elsif input == "exit"
     else
       puts "\nOops, please put in a valid input"
       choose_team
     end 
   end 
  
   def display_team_players(team) #scrape players 
     NBA::Scraper.scrape_all_items(team) # "category" returns object ID, name and team url and scraper method returns player names
     team.items.each.with_index(1) do |item, index|
       #prints out information on each team --> players and schedule
       puts "\nClick here to see the team schedule for the #{team.name}: #{item.schedule_link}".colorize(:blue)
        puts "\nHere are the players for the #{team.name}: ".colorize(:blue) 
       puts "\n#{index}. #{item.players}".colorize(:red)
     end 
     second_menu
   end 
   
   def scrape_teams #this method is calling my scraper class to scrape
     #scrape the teams page
    url = "https://www.nba.com/teams"
    #how to call the scraper method 
    team = NBA::Scraper.scrape_all_teams(url) #should make objects
   end 
   
   def second_menu
   puts "\nWould you like to look at another team? Type 'yes'\n"
   puts "\nWould you like to go to the start? Type 'start'\n"
   puts "\nWould you like to exit? Type 'exit'\n"
   input = gets.strip.downcase
    if input == "yes"
      list_teams
      choose_team
    elsif input == "start"
      menu
    elsif input == "exit"
      puts "\nGoodbye!".(:blue)
    else
      puts "\nSorry I don't understand".(:blue)
      second_menu
    end
  end 
end 

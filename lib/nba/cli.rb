#cli is the only place that talks to the user 

class NBA::CLI 
  
  def start #instance method
    puts "Welcome to the NBA.com!"
    menu
  end 
  
  def menu
    puts "\nWould you like to see the current teams?"
    puts "\nPlease type yes or exit"
    input = gets.strip.downcase
    case input #case statement 
      when "yes"
        puts "\nThese are the current NBA teams: "
        scrape_teams
        list_teams
        choose_team
      when "exit"
        puts "\nGoodbye"
      else
        puts "\nSorry, I didn't understand that input"
        menu
    end 
  end 
  
   def list_teams
        NBA::Team.all.each.with_index(1) do |team, index|
          puts "#{index}. #{team.name}"  #printing out the team names
        end 
      end 
      
   def choose_team
     puts "\nChoose a team by selecting a number 1-30:" #adding a line break by using \n
     input = gets.strip.to_i #strip removes whitespace on both sides
     max = NBA::Team.all.length
     if input.between?(1,max)
       team = NBA::Team.all[input-1]
       puts "\nThese are the players for the #{team.name}: "
       display_team_players(team)
       want_more_info(team)
     elsif input == "exit"
     else
       puts "\nOops, please put in a valid input"
       choose_team
     end 
   end 
   
  def want_more_info(team)
    puts "\nWant More Info? Type yes or no"
    input = gets.strip.downcase
    if input == "yes"
      puts "\nHere are the current players:"
      NBA::Scraper.scrape_all_items(team.url)
    else 
      puts "\nNo worries! Visit us again soon."
    end 
  end 
  
   def display_team_players(team) #scrape players 
     NBA::Scraper.scrape_all_items(team) # "category" returns object ID, name and team url and scraper method returns player names
 end 
   
   def scrape_teams #this method is calling my scraper class to scrape
     #scrape the teams page
    url = "https://www.nba.com/teams"
    #how to call the scraper method 
    NBA::Scraper.scrape_all_teams(url) #should make objects
   end 
   
   def second_menu
   puts "\nWould you like to look at another team? Type 'Yes'"
   puts "\nWould you like to go to the start? Type 'Start'"
   puts "\nWould you like to exit? Type 'Exit'"
   input = gets.strip.upcase
    if input == "Yes"
      list_teams
      choose_team
    elsif input == "Start"
      menu
    elsif input == "Exit"
      puts "\nGoodbye!"
    else
      puts "\nSorry I don't understand"
      second_menu
    end
  end 
end 

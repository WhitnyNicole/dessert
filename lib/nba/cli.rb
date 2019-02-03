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
        menu #recursion, which means we just restart at the menu ---> when there is bad user input
      end 
    end 
  
    def list_teams
      NBA::Team.all.each.with_index(1) do |team, index| 
      #tell you what you want your index to start with. Team is an array that naturally starts at 0
      #team is a variable of each individual team
      #index is a variable that keeps track of your index
      puts "#{index}. #{team.name}"  
      # have to do team.name so that it's printing out the team names and not the object ID 
      end 
    end 
      
    def choose_team
      puts "\nChoose a team by selecting a number 1-30:".colorize(:blue) 
      input = gets.strip.to_i #strip removes whitespace on both sides
      max = NBA::Team.all.length
      if input.between?(1,max)
        team = NBA::Team.all[input-1] #-1 represents the index of the array which allows us to retrieve the team 
        display_team_players(team)
      elsif input == "exit"
      else
        puts "\nOops, please put in a valid input"
        choose_team
      end 
    end 

    def display_team_players(team) #team represents a team object #second level scrape returns players and schedule_link
      # "team" returns object ID, name and team url 
      NBA::Scraper.scrape_all_items(team) 
        puts "\n------------------------------------------------------------------------------"
        puts "\nGreat! Here's more info on the #{team.name}. "
        puts "\nSee the current players: ".colorize(:blue)
        team.scouting_report.each do |items| #--->represents an array of profile objects 
        items.array_of_player_names.each.with_index(1) do |player_name, index|
          puts "#{index}: #{player_name}"
        end
          puts "\nSee the team schedule: ".colorize(:blue)
          puts "https://www.nba.com#{items.schedule_link}"
          puts "\n-------------------------------------------------------------------------------"
        end 
        second_menu
    end 
   
    def scrape_teams 
      #this method is not scraping, it's only calling my scraper class to scrape
      url = "https://www.nba.com/teams" #this could move to scraper method
      team = NBA::Scraper.scrape_all_teams(url) #this should make objects
      #NBA::Scraper is how to call the scraper method 
    end 
   
    def second_menu
      puts "\nWould you like to look at another team? Type 'yes'\n"
      puts "\nWould you like to go to the start? Type 'start'\n"
      puts "\nWould you like to exit? Type 'exit'\n"
      input = gets.strip.downcase
      if input == "yes"
        puts "\nThese are the current NBA teams: ".colorize(:blue)
        list_teams
        choose_team
      elsif input == "start"
        menu
      elsif input == "exit"
        puts "\nGoodbye!"
      else
        puts "\nSorry I don't understand"
        second_menu
      end
    end 
  end 
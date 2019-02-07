class NBA::CLI 
  
    def start 
      puts "Welcome to the NBA.com!".colorize(:blue)
      menu
    end 
  
    def menu
      puts "\nWould you like to see the current teams? Type 'yes' or 'exit'.".colorize(:blue)
      input = gets.strip.downcase 
      case input
        when "yes"
          puts "\nThese are the current NBA teams: ".colorize(:blue)
          scrape_teams
          list_teams
          choose_team
        when "exit"
          puts "\nGoodbye!"
        else
          puts "\nSorry, I didn't understand that input".colorize(:red)
      end 
    end 
  
    def list_teams
      NBA::Team.all.each.with_index(1) do |team, index|
      puts "#{index}. #{team.name}"  
      end 
    end 
      
    def choose_team
      puts "\nChoose a team by selecting a number 1-30:".colorize(:blue) 
      input = gets.strip.to_i 
      max = NBA::Team.all.length
      if input.between?(1,max)
        team = NBA::Team.all[input-1]  
        display_team_players(team)
      elsif input == "exit"
      else
        puts "\nOops, please put in a valid input".colorize(:red)
        choose_team
      end 
    end 

    def display_team_players(team) 
      NBA::Scraper.scrape_all_items(team) 
        puts "\n------------------------------------------------------------------------------"
        puts "\nGreat! Here's more info on the #{team.name}. "
        puts "\nSee the current players: ".colorize(:blue)
        team.scouting_report.each do |items| 
        items.roster_array.each do |player|
          puts player
        end
          puts "\nSee the team schedule: ".colorize(:blue)
          puts "https://www.nba.com#{items.schedule_link}"
          puts "\n-----------------------------------------------------------------------------"
        end 
        second_menu
    end 
   
    def scrape_teams 
      url = "https://www.nba.com/teams" 
      NBA::Scraper.scrape_all_teams(url) if NBA::Team.all == [] 
      end 

   
    def second_menu
      puts "\nWould you like to look at another team? Type 'yes'\n"
      puts "\nWould you like to exit? Type 'exit'\n"
      input = gets.strip.downcase
      if input == "yes"
        puts "\nPlease select another NBA team: ".colorize(:blue)
        list_teams
        choose_team
      elsif input == "exit"
        puts "\nGoodbye!"
      else
        puts "\nSorry I don't understand".colorize(:red)
        second_menu
      end
    end 
  end 
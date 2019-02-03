class NBA::Scraper
  
    #open the url and scrape all the teams
    #must include require "nokogiri"
    
    def self.scrape_all_teams(url) #first scrape, scrapes all the teams
      webpage = Nokogiri::HTML(open(url)) #opens webpage
      section = webpage.css("div.team__list_wrapper") #list of teams
      array_of_teams = section.css("div.team__list a") #returns team name
      array_of_teams.map do |team|
        NBA::Team.new(team.text, team.attributes["href"].value)
      end 
    #using .map, the return value is an array of objects (all the teams)
    end
  

    def self.scrape_all_items(team) #class method 
      #Creating an Instance
      # passing in team as an object so that I can add more attributes 
      #second scrape, scraping individual team's website to get players and schedule link 
      webpage = Nokogiri::HTML(open(team.url)) #this represents the url of my team object
      profiles = webpage.css("div.team_profile") #returns team profile
      profiles.each do |card|
  
      items = NBA::Items.new 
      #instantiate a new one. Since we are inside of the each, we need to save as a variable so that you can add attributes ---> this is creating an instance 
  
      #Assigning Attributes 
      
      
      items.array_of_player_names = card.css("p.nba-player-index__name").map do |player|
      player.text #returns single player name
      # binding.pry
      space = player.text.index(/[A-Z]/, 2)
      name_with_space = player.text.insert(space, ' ')
      end
      
      
      
      # assign this to the items since array_of_player_names will be attr_accessor, which means that there is a method called array_of_player_names=  ----> this only works if it's attached to an instance of an item 
  
      items.schedule_link = card.css("team-info-stats")[0].next_element.css("a").attr("href").value
      #Associating Objects
      team.add_items(items) 
      end 
    end 
  end 

    
class NBA::Scraper
    
    def self.scrape_all_teams(url) #using self. this is a class method --> gives program more flexibility because you don't have to keep track of an instance
      #open the url and scrape all the teams
      webpage = Nokogiri::HTML(open(url)) #opens webpage and must include require "nokogiri" and "open-uri" (envoronment file)
      section = webpage.css("div.team__list_wrapper") #list of teams
      array_of_teams = section.css("div.team__list a") #returns all team names
      array_of_teams.map do |team| #represents one team name
        NBA::Team.new(team.text, team.attributes["href"].value)
        #create a new instance of team object with name and url 
      end 
      #using .map, the return value is an array of objects (all the team names) --> returns new array 
      #using Object Oriented programming helps to keep track of both url and name (tied together) --> team object has 2 attributes (name/url)
    end
  

    def self.scrape_all_items(team) 
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

    
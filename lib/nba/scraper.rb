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
  

#   def self.scrape_all_items(team) #class method ---> passing in team as an object so that I can add more attributes 
#     #second scrape, scraping individual team's website to get players and schedule link 
#     webpage = Nokogiri::HTML(open(team.url)) #this represents the url of my team object 
#     items = webpage.css("div.team_profile") #returns team profile
#     items.each do |item|
#       binding.pry
#       item = NBA::Items.new
#       #Assigning object attributes
#       item.players = webpage.css("p.nba-player-index__name") #returns player names
#       item.schedule_link = webpage.css("team-info-stats")[0].next_element.css("a").attr("href").value #returns individual team schedule link 
#       #Associated objects
#       team.add_item(item)
#     end 
#   end 
# end 

# Testing new second scraper:

  def self.scrape_all_items(team) #class method 
  #Creating an Instance
  webpage = Nokogiri::HTML(open(team.url)) #this represents the url of my team object 
  profiles = webpage.css("div.team_profile") #returns team profile
  profiles.each do |card|
  
  items = NBA::Items.new 
  
  #Assigning Attributes 
  items.array_of_player_names = card.css("p.nba-player-index__name").text
  items.schedule_link = card.css("team-info-stats")[0].next_element.css("a").attr("href").value
  #Associating Objects
  team.add_items(items) 
 
    end 
  end 
end 

  
  
  
  

    # def self.scrape_all_items(team) #class method ---> passing in team as an object so that I can add more attributes 
    # #second scrape, scraping individual team's website to get players and schedule link 
    # webpage = Nokogiri::HTML(open(team.url)) #this represents the url of my team object 

    # profiles = webpage.css("div.team_profile") #returns team profile
    # profiles.each do |profile|
    
    #Assigning object attributes:
    #items = NBA::Items.new ---> instantiate a new one. Since we are inside of the each, we need to save as a variable so that you can add attributes ---> this is creating an instance 
    
      # array_of_player_names = profile.css("p.nba-player-index__name") > adding .text returns players names
      #schedule_link = profiles.css("team-info-stats")[0].next_element.css("a").attr("href").value
    
      #items.array_of_player_names  ---> assign this to the items since array_of_player_names will be attr_accessor, which means that there is a method called array_of_player_names=  ----> this only works if it's attached to an instance of an item
    
      #items.schedule_link = profiles.css("team-info-stats")[0].next_element.css("a").attr("href").value
    
    
      #Associate Items and Team:
      #team.profile << items   -----> instance of a team ----> should have object ID and all the attributes 
      #items.team = items   ---->sets up reciprocal relationship between team and items
    
    
    #how to instantiate an item object (done on line 41):
    #For every profile that we are looking at, we are going to instantiate an object and then add those object's attributes
    
    
    
    #Notes
    #team =  
    #<NBA::Team:0x00000000fa4920
    # @items=[],
    # @name="Atlanta Hawks",
    # @url="http://www.nba.com/teams/hawks"
    
    #webpage.css("div.team_profile").text
    #.text works on an array 
    #returns all of the items 
    #then need to iterate 

    # profiles = webpage.css("div.team_profile") #returns team profile
    # profiles.each do |profile|
      # team.profiles = profile  ------> adding profile as an attribue to team -----> if it's an array can use << method 
      #need to add profile to Team class 
      #idea is to be able to print team.profile in cli 
      
      
      #we have two separate objects: team and items 
      #setting up a has many relationship between team and items 
      
      #class Team
      #attr_accessor :name, :url
      #attr_readers :profile ---> so profile doesn't get overwritten 
      #assigning attributes in initialize method 
      
      #class Items 
      #attr_accessor :array_of_player_names, :schedule_link, :team
      #@@all = [] ---> would need to have an initialize method to store in @@all
      #could do @@profile = []
      
      #each team object will have an array of items 
      
      #second level scrape will instantiate an item and then add it to the team object 

      


    
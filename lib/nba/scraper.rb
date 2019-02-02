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
  

  def self.scrape_all_items(team) #class method ---> passing in team as an object so that I can add more attributes 
    #second scrape, scraping individual team's website to get players and schedule link 
    webpage = Nokogiri::HTML(open(team.url)) #this represents the url of my team object 
    items = webpage.css("div.team_profile") #returns team profile
    items.each do |item|
      binding.pry
      item = NBA::Items.new
      #Assigning object attributes
      item.players = webpage.css("p.nba-player-index__name") #returns player names
      item.schedule_link = webpage.css("team-info-stats")[0].next_element.css("a").attr("href").value #returns individual team schedule link 
      #Associated objects
      team.add_item(item)
    end 
  end 
end 


    # def self.scrape_all_items(team) #class method ---> passing in team as an object so that I can add more attributes 
    # #second scrape, scraping individual team's website to get players and schedule link 
    # webpage = Nokogiri::HTML(open(team.url)) #this represents the url of my team object 

    # profiles = webpage.css("div.team_profile") #returns team profile
    # profiles.each do |profile|
      # array_of_player_names = profile.css("p.nba-player-index__name") > adding .text returns players names
    #schedule_link = profiles.css("team-info-stats")[0].next_element.css("a").attr("href").value
    
    
    
    
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
      #attr_accessor :players, :schedule_link
      #@@all = [] ---> would need to have an initialize method to store in @@all
      #could do @@profile = []
      
      #each team object will have an array of items 
      
      #second level scrape will instantiate an item and then add it to the team object 

      


    
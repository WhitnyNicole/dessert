class NBA::Scraper
  
  def self.scrape_categories(url)
    #open the url and scrape all the categories
    #must include require "nokogiri"
    webpage = Nokogiri::HTML(open(url)) #opens webpage
    section = webpage.css("div.team__list_wrapper") #list of teams
    array_of_teams = section.css("div.team__list a") #returns team name
    array_of_teams.map do |team|
    NBA::Team.new(team.text, team.attributes["href"].value)
    end 
    #using .map return value is an array of objects (all the teams)
  end
  
  
  def self.scrape_items(category) #category is representing an object
    webpage = Nokogiri::HTML(open(category.url)) #opens webpage the url is for the specific team
    players = webpage.css("p.nba-player-index__name")
    players.each do |nodeset|
    NBA::Players.new(nodeset.text)
      puts "#{nodeset.text}"
    end 
      
      # schdule = webpage.css("team-info-stats")[0].next_element.css("a").text #see full scheudle #don't need this 
      scheudle_link = webpage.css("team-info-stats")[0].next_element.css("a").attr("href").value
      
      #nba = NBA::NBA.new which is creating an instance
      
      # category.items << item_link.text
      #try to find css selector that returns the card of the full player info (position, height, weight)
      
      #Assigning object attributes
      #then add nba.position = item_link.css("")
      #nba.position = position[0]
      
      #how to associate nba and category 
      #this is an instance of a category --> category.players << nba
      
    end 
  end 
end 

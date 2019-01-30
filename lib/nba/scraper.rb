class NBA::Scraper
  
  def self.scrape_categories(url)
    #open the url and scrape all the categories
    #must include require "nokogiri"
    webpage = Nokogiri::HTML(open(url)) #opens webpage
    section = webpage.css("div.team__list_wrapper") #list of teams
    array_of_teams = section.css("div.team__list a") #returns team name
    array_of_teams.map do |team|
    NBA::Category.new(team.text, team.attributes["href"].value)
    end 
    #using .map return value is an array of objects (all the teams)
  
  end
  
  
  def self.scrape_items(category) #category is representing an object
    webpage = Nokogiri::HTML(open(category.url)) #opens webpage
    items = webpage.css("a p.nba-player-index__name")
    items.each do |item_link|
      category.items << item_link.text
    end 
  end 
    
  def self.scrape_players(url) #class method 
     webpage = Nokogiri::HTML(open(url)) 
     players = webpage.css("p.nba-player-index__name")
       puts "Current players are: #{players.text}"
     end 
 end 
end 

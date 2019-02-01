class NBA::Scraper
  
     #open the url and scrape all the categories
    #must include require "nokogiri"
    
  def self.scrape_all_teams(url)
    webpage = Nokogiri::HTML(open(url)) #opens webpage
    section = webpage.css("div.team__list_wrapper") #list of teams
    array_of_teams = section.css("div.team__list a") #returns team name
    array_of_teams.map do |team|
    NBA::Team.new(team.text, team.attributes["href"].value)
    end 
    #using .map return value is an array of objects (all the teams)
  end
  
  
#   def self.scrape_all_items(team) #category is representing an object
#     webpage = Nokogiri::HTML(open(team.url)) #opens webpage the url is for the specific team
#     players = webpage.css("p.nba-player-index__name") #returning all players for selected team
#     players.each do |nodeset|
#     NBA::Items.new(nodeset.text)
#       puts "\n#{nodeset.text}" #player name
#   end 
# end 
# end 


    def self.scrape_all_items(team) 
    webpage = Nokogiri::HTML(open(team.url))
    items.players = webpage.css("div.team_profile").css("p.nba-player-index__name").text 
    items.schedule_link = webpage.css("div.team_profile").css("team-info-stats")[0].next_element.css("a").attr("href").value
    
    stats.each do |stat|
      
      items = NBA::Items.new
      
      team.add_items(item)
       binding.pry
    end 
  end 
end 
    
    
    
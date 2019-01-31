class NBA::Scraper
  
  def self.scrape_all_teams(url)
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
  
  
  def self.scrape_all_players(category) #category is representing an object
    webpage = Nokogiri::HTML(open(category.url)) #opens webpage the url is for the specific team
    players = webpage.css("p.nba-player-index__name")
    players.each do |nodeset|
    NBA::Players.new(nodeset.text)
      puts "\n#{nodeset.text}"
    scheudle_link = webpage.css("team-info-stats")[0].next_element.css("a").attr("href").value
    NBA::Team.new(team.text, team.attributes["href"].value)
      
      # schdule = webpage.css("team-info-stats")[0].next_element.css("a").text #see full scheudle #don't need this 
    end 
  end 
end 


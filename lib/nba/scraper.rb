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
  

  def self.scrape_all_items(team) #second scrape, scraping individual team's website
    webpage = Nokogiri::HTML(open(team.url))
    items = webpage.css("div.team_profile") #returns team profile
    items.each do |item|
      item = NBA::Items.new
      #Assigning object attributes
      item.players = webpage.css("p.nba-player-index__name") #returns player names
      item.schedule_link = webpage.css("team-info-stats")[0].next_element.css("a").attr("href").value #returns individual team schedule link 
      
      #Associated objects
      team.add_item(item)
    end 
  end 
end 

    
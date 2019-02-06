class NBA::Scraper
    
    def self.scrape_all_teams(url)
      webpage = Nokogiri::HTML(open(url)) 
      section = webpage.css("div.team__list_wrapper") 
      array_of_teams = section.css("div.team__list a") 
      array_of_teams.map do |team| 
        NBA::Team.new(team.text, team.attributes["href"].value)
      end 
    end
  

    def self.scrape_all_items(team) 
      webpage = Nokogiri::HTML(open(team.url)) 
      profiles = webpage.css("div.team_profile") 
      profiles.each do |card|
  
      items = NBA::Items.new
  
      items.roster_array << card.css("p.nba-player-index__name").map do |player|
      player.text 
      space = player.text.index(/[A-Z]/, 2) 
      name_with_space = player.text.insert(space, ' ') 
      end
      
      items.schedule_link = card.css("team-info-stats")[0].next_element.css("a").attr("href").value
      
      team.add_items(items) 
      end 
    end 
  end 

    
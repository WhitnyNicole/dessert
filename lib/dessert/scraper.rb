class Dessert::Scraper
  
  def self.scrape_categories(url)
    #section.css("span.title")[0].text returns "chocolate chocolate chip cookie"
    #open the url and scrape all the categories
    #must include require "nokogiri"
    
    webpage = Nokogiri::HTML(open(url)) #opens webpage
    section = webpage.css("div.team__list_wrapper") #list of teams
    
    array_of_teams = section.css("div.team__list") #returns team name
    
    array_of_teams.map do |team|
      team.text
    # Dessert::Category.new(team.text)
    end 
    #using .map return value is all of the teams 
  
  end 
  
end 


class Dessert::Scraper
  
  def self.scrape_categories(url)
    #cookies = webpage.css("div.info")
    #open the url and scrape all the categories
    #must include require "nokogiri"
    
    webpage = Nokogiri::HTML(open(url)) #opens webpage
    section = webpage.css("div.info")
    array_of_links = webpage.css("span.title")
    name = webpage.css("span.title")[0].text #returns "Chocolate Chocolate Chip Cookie"
    
      
    array_of_links.map do |link|
      binding.pry
      Dessert::Category.new(link.text, link.attributes["href"].value) 
      #link.attributes["href"].value, will give link
      #return value will now be an array of objects because .map is used 
    end 
    
  end 
  
end 
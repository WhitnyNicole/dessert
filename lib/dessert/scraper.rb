class Dessert::Scraper
  
  def self.scrape_categories(url)
    #cookies = webpage.css("div.info"), need to look at this one again
    #open the url and scrape all the categories
    #must include require "nokogiri"
    
    webpage = Nokogiri::HTML(open(url)) #opens webpage
    name = webpage.css("span.title")[0].text #returns "Chocolate Chocolate Chip Cookie"
    array_of_links = webpage.css("span.title")
    
    array_of_links.each do |link|
      Category.new(link.text, ?)
    end 
    
  end 
  
end 
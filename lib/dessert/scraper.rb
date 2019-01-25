class Dessert::Scraper
  
  def self.scrape_categories(url)
    #section.css("span.title")[0].text returns "chocolate chocolate chip cookie"
    #open the url and scrape all the categories
    #must include require "nokogiri"
    
    webpage = Nokogiri::HTML(open(url)) #opens webpage
    section = webpage.css("div.info")
    array_of_links = section.css("span.title")
    
      
    array_of_links.map do |link|
      binding.pry
      link.text
      Dessert::Category.new(link.text, link.attributes["href"].value) 
      
      
      #link.attributes["href"].value, will give link
      #return value will now be an array of objects because .map is used 
    end 
    
  end 
  
end 
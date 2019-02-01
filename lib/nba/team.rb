class NBA::Team
  
  attr_accessor :name, :url 
  attr_reader :items

 
  @@all = []
  def initialize(name, url)
    @name = name
    @url = "http://www.nba.com" + url 
    @items = []
    @@all << self #remembering the object
  end 
  
  def self.all
    @@all
  end 
  
   def add_item(item)
    self.items << item
    item.team = self 
  end 
end 
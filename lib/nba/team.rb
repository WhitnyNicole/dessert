class NBA::Team
  
  attr_accessor :name, :url, :items

 
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
  
  def add_items
    @items << item
    item.team = self 
  end 
  
  def items
    @items
  end 
end 
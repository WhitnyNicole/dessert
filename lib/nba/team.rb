class NBA::Team
  
  attr_accessor :name, :url 
  attr_reader :item

 
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
    self.item << item
    items.team = self 
  end 
end 
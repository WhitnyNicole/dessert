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
  
  def add_items
    self.items << item
    self.team = self 
  end 
end 
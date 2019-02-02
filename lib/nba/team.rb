class NBA::Team
  
  attr_accessor :name, :url 
  attr_reader :profiles #has many relationship

 
  @@all = []
  def initialize(name, url)
    @name = name
    @url = "http://www.nba.com" + url 
    @profiles = []
    @@all << self #remembering the object
  end 
  
  def self.all
    @@all
  end 
  
  def add_items(items) #items is an object
  self.profiles << items 
  items.team = self 
  end 
end 
class NBA::Team
  
  attr_accessor :name, :url
  attr_reader :scouting_report #has many relationship

 
  @@all = []
  def initialize(name, url)
    @name = name
    @url = "http://www.nba.com" + url 
    @scouting_report = []
    @@all << self #remembering the object
  end 
  
  def self.all
    @@all
  end 
  
  def add_items(items) #items is an object
  self.scouting_report << items 
  items.team = self 
  end 
end 
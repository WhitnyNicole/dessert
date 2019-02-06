class NBA::Team
  
  attr_accessor :name, :url
  attr_reader :scouting_report 
  
    
  @@all = [] 
  
  def initialize(name, url)
    @name = name
    @url = "http://www.nba.com" + url 
    @scouting_report = [] 
    @@all << self 
  end
  
  def self.all 
    @@all
  end 
  
  def add_items(items) 
    self.scouting_report << items  
    items.team = self 
  end 
end 
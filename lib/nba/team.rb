class NBA::Team
  
  attr_accessor :name, :url
  attr_reader :scouting_report #has many relationship
  #we have two separate objects: team and items 
  #setting up a has many relationship between team and items 
  #reader/getter returns information stored in an instance such as @name
  #writer/setter such as name=
    
  @@all = []
  
  def initialize(name, url)
    @name = name
    @url = "http://www.nba.com" + url 
    @scouting_report = []
    @@all << self #remembering the object
  end 
  
  def self.all #needed because of @@all = [] and @@all << self. Allows us to call team.all and get back information
    @@all
  end 
  
  def add_items(items) #items is an object
    self.scouting_report << items 
    items.team = self 
  end 
end 
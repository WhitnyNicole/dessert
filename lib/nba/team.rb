class NBA::Team
  
  attr_accessor :name, :url
  attr_reader :scouting_report #has many relationship
  #we have two separate objects: team and items 
  #setting up a has many relationship between team and items 
  #reader/getter returns information stored in an instance such as @name
  #writer/setter creates name, such as name=
    
  @@all = [] #class variable that represents saving every instance of a class (i.e all the items for all of the teams)
  
  def initialize(name, url)
    @name = name
    @url = "http://www.nba.com" + url 
    @scouting_report = [] #every item object for that one instance of a team object
    @@all << self #remembering the object
  end 
  
  def self.all #needed because of @@all = [] and @@all << self. Allows us to call team.all and get back information
    @@all
  end 
  
  def add_items(items) #items is an object
    self.scouting_report << items #adding an instance of the items object to the scouting_report array 
    items.team = self #tell the team object about it's items 
  end 
end 
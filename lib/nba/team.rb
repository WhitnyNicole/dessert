class NBA::Team
  
  attr_accessor :name, :url, :players

 
  @@all = []
  def initialize(name, url)
    @name = name
    @url = "http://www.nba.com" + url 
    @players = []
    @@all << self #remembering the object
  end 
  
  def self.all
    @@all
  end 
  
  def add_players
    @players << player
    player.team = self 
  end 
  
  def players
    @players
  end 
end 
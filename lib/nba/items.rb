class NBA::Items
  
  attr_accessor :roster_array, :schedule_link, :team

  @@all = []
  
  def initialize
    @roster_array = []
  end 
  
  def add_player(roster_array)
    @add_player << roster_array
  end 
end 
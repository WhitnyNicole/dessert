class NBA::Items
  
  attr_accessor :array_of_player_names, :schedule_link, :team
  
  @@all = []
  # @array_of_player_names = []

  def initialize 
    @array_of_player_names = array_of_player_names
    @schedule_link = schedule_link
    @team = team 
  end
  
  def self.all
    @@all
  end 
end 
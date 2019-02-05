class NBA::Items
  
  attr_accessor :array_of_player_names, :schedule_link, :team
  #"belongs to" relationship by adding :team as attr_accessor
  
  @@all = []
  # @array_of_player_names = []

  def initialize 
    @array_of_player_names = array_of_player_names
    @schedule_link = schedule_link
  end
  
  def self.all
    @@all
  end 
end 
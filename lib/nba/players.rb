class NBA::Players
  #rename player 
  
   attr_accessor :name, :position, :height, :weight, :category
  
  @@all = []
  
  def initialize(name)
    @name = name
    @players = []
    @@all << self #remembering the object
  end 
  
  def self.all
    @@all
  end 
end 
  
 
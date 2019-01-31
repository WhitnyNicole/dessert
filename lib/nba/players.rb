class NBA::Players
  
   attr_accessor :name, :team
  
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
  
 
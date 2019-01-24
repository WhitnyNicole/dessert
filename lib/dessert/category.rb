class Dessert::Category
  
  attr_accessor :name, :url
  @@all = []
  def initialize(name, url)
    @name = name
    @url = url 
    @@all << self #remembering the object
  end 
  
  def self.all
    @@all
  end 
end 
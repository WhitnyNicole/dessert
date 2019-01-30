#cli is the only place that talks to the user 

class NBA::CLI 
  
  def start #instance method
    puts "Welcome to NBA.com"
    menu
  end 
  
  def menu
    puts "Would you like to see the current teams?"
    puts "Type yes or exit"
    input = gets.strip.downcase
    case input #case statement 
      when "yes"
        puts "These are the current NBA teams: "
         scrape_teams
        list_categories
        choose_category
      when "exit"
        puts "Goodbye"
      else
        puts "Sorry, I didn't understand that input"
        menu
    end 
  end 
  
   def list_categories
        NBA::Category.all.each.with_index(1) do |category, index|
          puts "#{index}. #{category.name}"  #printing out the category names
        end 
      end 
      
   def choose_category
     puts "\nChoose a team by selecting a number 1-30:" #adding a line break by using \n
     input = gets.strip.to_i #strip removes whitespace on both sides
     max = NBA::Category.all.length
     if input.between?(1,max)
       category = NBA::Category.all[input-1]
       display_category_items(category)
       puts "#{category.name}"
       want_more_info(category)
     elsif input == "exit"
     #allow this method to end
     else
       puts "\nOops, please put in a valid input"
       choose_category
     end 
   end 
   
  def want_more_info(category)
    puts "Want More Info? Type yes or no"
    input = gets.strip.downcase
    if input == "yes"
      puts "Here are the current players:"
      NBA::Scraper.scrape_players(category.url)
    else 
      puts "No worries! Visit us again soon."
    end 
  end 
  
   def display_category_items(category)
     NBA::Scraper.scrape_items(category)
     #puts here are the players for #{category.name}\n"
    # category.nba.each.with_index(1) do |deal, index|
    # puts "\n#{index}. #(deal.product)"
    # puts Price, #{deal.price}
    # puts deal.description
   end 
   
   def scrape_teams #this method is calling my scraper class to scrape
     #scrape the teams page
    url = "https://www.nba.com/teams"
    #how to call the scraper method 
    NBA::Scraper.scrape_categories(url) #should make objects
   end 
end 

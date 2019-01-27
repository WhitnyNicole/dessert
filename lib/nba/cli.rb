#cli is the only place that talks to the user 

class NBA::CLI 
  
  def start #instance method
    puts "Welcome to NBA.com"
    menu
  end 
  
  def menu
    puts "What type of information would you like?"
    puts "Team, Schedule, Standings?"
    puts "Type the item of your choice"
    input = gets.strip.downcase
    case input #case statement 
      when "team"
        puts "These are the NBA teams: "
        scrape_teams
        list_categories
        choose_category
      when "schedule" 
        puts "you selected schedule"
        #scrape the schedule page
        #url https://stats.nba.com/schedule/
      when "standings"
        puts "you selected standings"
        #scrape the standings page
        #url http://www.nba.com/standings#/
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
     puts "Want More Info? (Y/N)"
     input = gets.strip.downcase
     if input == "y"
       puts "here are the current players:"
       #2nd scrape
     else 
       puts "No worries! Visit us again soon."
     end 
   end 
  
   def display_category_items(category)
     NBA::Scraper.scrape_items(category)
     category.items
   end 
   
   def scrape_teams #this method is calling my scraper class to scrape
     #scrape the teams page
    url = "http://www.nba.com/teams"
    #how to call the scraper method 
    NBA::Scraper.scrape_categories(url) #should make objects
   end 
end 
 

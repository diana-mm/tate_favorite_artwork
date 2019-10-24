require_relative './config/environment.rb'

def start

  @@selected_artist = nil
  @@selected_artwork = nil
  
  @@cli = Cli.new
 
  @@current_user = new_or_returning
  
    welcome_page
    main_menu
    exit
    favoriting_artwork


end  

def welcome_page
 
end

def new_or_returning
  system("imgcat ./lib/images/download.png")
  puts "Welcome to the Tate Museum Arts App"
  puts ""
  user = @@cli.prompt_for_new_or_returning_user
  puts ""
  if user == "New"
    new_user = @@cli.prompt_for_new_user
    @@current_user = User.create(name: new_user)
    puts ""
  else
    returning_user = @@cli.prompt_for_returning_user
    @@current_user = User.find_by(name: returning_user)
    puts ""
  end
end

def main_menu
  puts "Main Menu"
    selection = @@cli.main_menu_prompt
    case selection
    when 'View Favorites'
      puts ""
      puts 'Your Favorites'
      @@cli.view_favorites(@@current_user)
      main_menu
    when 'Browse Artwork'
      puts ""
        @@selected_artist = @@cli.browse_by_artist(Artist.all)
        puts ""
        @@selected_artwork = @@cli.artwork_by_artist(@@selected_artist)
        puts ""
        favoriting_artwork
        puts ""
    when 'Recommend Artwork'
      puts ""
        puts 'Here are some recommendations:'
        @@cli.recommend_artwork(Artwork.all.sample(5))
        puts ''
        favoriting_artwork
        puts ""
    when 'Exit'
      puts "Thank You for Visiting!"
      exit
    end
end

  def favoriting_artwork
   art_selection = @@cli.favorite_artwork(@@selected_artwork)
   case art_selection
   when 'Favorite Art Piece'
    puts ""
    Favorite.create(user: @@current_user, artwork: @@selected_artwork)
    puts ""
     @@cli.view_favorites(@@current_user)
     puts ""
     main_menu
   when "Return to Main Menu"
    puts ""
     main_menu
   end
  end


start 
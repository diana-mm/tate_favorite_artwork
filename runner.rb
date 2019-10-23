require_relative './config/environment.rb'

def start

  @@selected_artist = nil
  @@selected_artwork = nil
  
  @@cli = Cli.new
 
  @@current_user = new_or_returning
  
    @@cli.welcome_page


    main_menu
    exit
    favoriting_artwork


end  

def new_or_returning
  user = @@cli.prompt_for_new_or_returning_user
  if user == "New"
    new_user = @@cli.prompt_for_new_user
    @@current_user = User.create(name: new_user)
  else
    returning_user = @@cli.prompt_for_returning_user
    @@current_user = User.find_by(name: returning_user)
  end
end

def main_menu
    selection = @@cli.main_menu_prompt
    case selection
    when 'View Favorites'
      puts 'Your Favorites'
      @@cli.view_favorites(@@current_user)
      main_menu
    when 'Browse Artwork'
        @@selected_artist = @@cli.browse_by_artist(Artist.all)
        @@selected_artwork = @@cli.artwork_by_artist(@@selected_artist)
        favoriting_artwork
    when 'Recommend Artwork'
        puts 'Here are some recommendations:'
        @@cli.recommend_artwork(Artwork.all.sample(5))
        favoriting_artwork
    when 'Exit'
      exit
    end
end

  def favoriting_artwork
   art_selection = @@cli.favorite_artwork(@@selected_artwork)
   case art_selection
   when 'Favorite Art Piece'
    Favorite.create(user: @@current_user, artwork: @@selected_artwork)
     @@cli.view_favorites(@@current_user)
     main_menu
   when "Return to Main Menu"
     main_menu
   end
  end


start 
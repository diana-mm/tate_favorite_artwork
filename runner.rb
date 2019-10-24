require_relative './config/environment.rb'

def start
  pid = fork{exec 'afplay','-v','-volume 0.75','./lib/music/music.mp3'}
  @@selected_artist = nil
  @@selected_artwork = nil
  @@cli = Cli.new
  @@current_user = new_or_returning
  
  main_menu
  exit
  favoriting_artwork
end  

def new_or_returning
  system("clear")
  system("imgcat ./lib/images/Tate_Logo.jpg")
  puts ""
  puts "Welcome to the Tate Collection App".black.on_red.bold
  `say "Welcome to the Tate Collection App"`
  puts ""
  user = @@cli.prompt_for_new_or_returning_user
  if user == "New"
    puts ""
    new_user = @@cli.prompt_for_new_user
    @@current_user = User.create(name: new_user)
  else
    puts ''
    returning_user = @@cli.prompt_for_returning_user
    @@current_user = User.find_by(name: returning_user)
  end
end

def main_menu
  puts ""
  `say "Main Menu"`
  puts "Main Menu".white.on_yellow.bold
  puts ""
    selection = @@cli.main_menu_prompt
    case selection
    when '★ View Favorites' 
      puts ""
      puts '★ Your Favorites'.white.on_green.bold
      @@cli.view_favorites(@@current_user)
      main_menu
    when '★ Browse Artwork'
      puts ""
        @@selected_artist = @@cli.browse_by_artist(Artist.all)
        @@selected_artwork = @@cli.artwork_by_artist(@@selected_artist)
        favoriting_artwork
    when '★ Recommend Artwork'
      puts ""
        puts 'Here are some recommendations:'.white.on_green.bold
       @@selected_artwork =  @@cli.recommend_artwork(Artwork.all.sample(5))
        favoriting_artwork
    when '★ Exit'
      system("clear")
      `say "Thank you for using the Tate Collection App"`
      puts "Thank You for Using the Tate Collection App!".black.on_red.bold
      system("imgcat ./lib/images/inside.jpg")
      fork{exec 'killall afplay'}
      exit
    end
end

  def favoriting_artwork
    # binding.pry
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
require_relative './config/environment.rb'

def start

  @@selected_artist = nil

    cli = Cli.new
     
    cli.welcome_page

    current_user = new_or_returning(cli)

    main_menu(cli)

    artists_artwork(cli)


end  

def new_or_returning(cli)
  user = cli.prompt_for_new_or_returning_user
  if user == "New"
    new_user = cli.prompt_for_new_user
    current_user = User.create(name: new_user)
  else
    returning_user = cli.prompt_for_returning_user
    current_user = User.find_by(name: returning_user)
  end
end

def main_menu(cli)
    selection = cli.main_menu_prompt
    case selection
    when 'Browse Artwork'
        @@selected_artist = cli.browse_by_artist(Artist.all)
    when 'View Favorites'
        puts 'Your Favorites'
        cli.view_favorites(Favorites.all)
    when 'Recommend Artwork'
        puts 'Here are some recommendations:'
        cli.recommend_artwork(Artwork.all.sample(5))
    end

    def artists_artwork(cli)
      cli.artwork_by_artist(@@selected_artist)
    end

    

end
      # binding.pry



start 
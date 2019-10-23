require_relative './config/environment.rb'

def start

    cli = Cli.new
     
    cli.welcome_page

    current_user = new_or_returning(cli)

    main_menu(cli)


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
        puts 'screen for browsing artwork'
    when 'View Favorites'
        puts 'screen for view favorites'
    when 'Recommend Artwork'
        puts 'screen for rec artwork'
    end

end


start 
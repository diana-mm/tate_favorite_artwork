require 'tty-prompt'
require 'pry'

class Cli
    attr_reader :prompt

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome_page
        puts "Welcome to the Tate Museum Arts App"
    end

    def prompt_for_new_or_returning_user
        prompt.select("Please Select New or Returning User", %w(New Returning))
    end

    def prompt_for_new_user
        prompt.ask('What is your name:')
    end

    def prompt_for_returning_user 
        names = User.pluck(:name)
        prompt.select("Please select your name", names)
    end

    def main_menu_prompt
        menu_options = ['Browse Artwork', 'View Favorites', 'Recommend Artwork']
        prompt.select("Please Select An Option:", menu_options)
    end

    def browse_by_artist(artists)
        
        prompt.select("Choose an artist to see their artwork:", artists)
    end

    def view_favorites(favorites)
        
        prompt.select("  ",["Browse Artist"])
    end

end
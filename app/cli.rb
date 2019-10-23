require 'tty-prompt'
require 'pry'

class Cli
    attr_reader :prompt

    def initialize
        @prompt = TTY::Prompt.new(symbols: {marker: '→'})
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
        menu_options = ['Browse Artwork', 'View Favorites', 'Recommend Artwork', 'Exit']
        prompt.select("Please Select An Option:", menu_options)
    end

    def browse_by_artist(artists)
         prompt.select("Choose an artist to see their artwork:", artists)
    end

    def view_favorites(user)
        user_favorites = Favorite.where(user: user)
        if user_favorites.length == 0
            puts 'You have no favorites'
        else
            user_favorites.each do |favorite|
                puts favorite.artwork.artist + " , " + favorite.artwork.title
            end
        end
    end

    def recommend_artwork(artworks)
        prompt.select("  Pick an Artwork to View:", artworks)
    end

    def artwork_by_artist(artist)
        art_artist = []
        art_artist = Artwork.all.select do |artwork|
             artwork.artist == artist.name 
        end
        prompt.select("Pick a piece of art:", art_artist)
    end

     def favorite_artwork(artwork)
        options = ['Favorite Art Piece', 'Return to Main Menu']
        prompt.select('What would you like to do?', options) 
    end
end
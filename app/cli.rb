require 'tty-prompt'
require 'paint'
require 'pry'

class Cli
    attr_reader :prompt

    def initialize
        @prompt = TTY::Prompt.new(symbols: {marker: '→'})
    end

    def prompt_for_new_or_returning_user
        prompt.select("Are you a New or Returning User?".magenta.on_yellow.bold, %w(New Returning))
    end

    def prompt_for_new_user
        prompt.ask('What is your name?'.white.on_red.bold)
    end

    def prompt_for_returning_user 
        if User.all.length == 0
            puts "No Current Users".blue.bold
            puts ""
            puts "New User".white.on_green
            puts ""
            prompt_for_new_user
        else
        names = User.pluck(:name)
        prompt.select("Please select your name:".white.on_red.bold, names)
        end
    end

    def main_menu_prompt
        menu_options = ['Browse Artwork', 'View Favorites', 'Recommend Artwork', 'Exit']
        prompt.select(" Please Select An Option:".white.on_red.bold, menu_options)
    end

    def browse_by_artist(artists)
         prompt.select("Choose an artist to see their artwork:".white.on_red.bold, artists)
    end

    def view_favorites(user)
        user_favorites = Favorite.where(user: user)
        if user_favorites.length < 1
            puts 'You have no favorites'.white.on_red.bold
        else
            user_favorites.each do |favorite|
                puts "#{favorite.artwork.title} by #{favorite.artwork.artist} "
            end
        end
    end

    def recommend_artwork(artworks)
        prompt.select("  Pick an Artwork to View:".yellow.on_red.bold, artworks)
    end

    def artwork_by_artist(artist)
        art_artist = []
        art_artist = Artwork.all.select do |artwork|
             artwork.artist == artist.name 
        end
        prompt.select("Pick a piece of art:".yellow.on_red.bold, art_artist)
    end

     def favorite_artwork(artwork)
        options = ['Favorite Art Piece', 'Return to Main Menu']
        prompt.select('What would you like to do?'.white.on_red.bold, options) 
    end
end
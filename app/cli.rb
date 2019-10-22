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

    # def enter_new_user_name

    
end
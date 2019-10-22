class Cli
    attr_reader :prompt

    def initialize
        @prompt = TTY::Prompt.new
    end

    def welcome_page
        puts "Welcome to the Tate Museum Arts App"
    end

    def prompt_for_new_or_returning_user
        prompt.select("Please Select:", ("New User","Returning User"))
    end

    def prompt_for__new_user
        prompt.ask('What is your name:')
    end

    def prompt_for_returning_user 
        names = User.pluck(:name)
        prompt.select("Please select your name", names)
    end

    








end
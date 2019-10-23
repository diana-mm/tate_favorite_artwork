
class Favorites < ActiveRecord::Base
    belongs_to :user
    belongs_to :artwork
    
    def to_s
        return "   #{artwork}"
    end
end
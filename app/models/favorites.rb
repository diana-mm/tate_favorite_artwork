
class Favorites < ActiveRecord::Base
    belongs_to :user
    belongd_to :artwork
end

class Artwork < ActiveRecord::Base
    has_many :favorites
    has_many :users, through: :favorites

    def to_s
        return "★ #{title} by #{artist} | View Image of Artwork Here: #{artwork_image}"
    end
end
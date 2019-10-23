
class Artwork < ActiveRecord::Base
    has_many :favorites

    def to_s
        return "#{title}, #{artist}, #{artwork_image}"
    end
end

class User < ActiveRecord::Base
    has_many :favorites
    has_many :artworks, through: :favorites
end
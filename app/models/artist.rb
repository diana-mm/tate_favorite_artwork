
class Artist < ActiveRecord::Base

def to_s
    return "★ #{name} | Artist's Bio: #{artist_info}"
end

end
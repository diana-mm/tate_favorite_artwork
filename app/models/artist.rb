class Artist < ActiveRecord::Base

def to_s
    return "#{name}, #{nationality}, #{artist_info}"
end

end
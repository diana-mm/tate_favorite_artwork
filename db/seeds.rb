require 'csv'
Artist.destroy_all
Artwork.destroy_all

CSV.foreach('lib/artist_data.csv', headers: true, header_converters: :symbol) do |row|
    Artist.create(
        name: row[:name],
        nationality: row[:placeofbirth],
        artist_info: row[:url]
    )    
end

CSV.foreach('lib/artwork_data.csv', headers: true, header_converters: :symbol) do |row|
    Artwork.create(
        title: row[:title],
        artist: row[:artist],
        artwork_image: row[:url],
        year_aquired: row[:acquisitionyear]
    )    
end
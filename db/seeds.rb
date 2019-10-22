require 'csv'
Artist.destroy_all

CSV.foreach('lib/artist_data.csv', headers: true, header_converters: :symbol) do |row|
    Artist.create(
        name: row[:name],
        nationality: row[:placeofbirth],
        artist_info: row[:url]
    )    
end
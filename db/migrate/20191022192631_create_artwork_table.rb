
class CreateArtworkTable < ActiveRecord::Migration[6.0]
  def change
    create_table :artworks do |t|
      t.string :title
      t.string :artist
      t.string :artwork_image
      t.string :year_aquired
    end
  end
end

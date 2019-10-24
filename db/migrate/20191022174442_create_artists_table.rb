
class CreateArtistsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :nationality
      t.string :artist_info
    end
  end
end

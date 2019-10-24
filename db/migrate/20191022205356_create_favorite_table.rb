
class CreateFavoriteTable < ActiveRecord::Migration[6.0]
  def change
    create_table :favorites do |t|
      t.references :user, index: true, foreign_key: true
      t.references :artwork, index: true, foreign_key: true  
    end
  end
end

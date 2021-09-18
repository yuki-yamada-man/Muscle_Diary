class CreateFoodFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :food_favorites do |t|

      t.timestamps
    end
  end
end

class CreateTrainingFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :training_favorites do |t|

      t.timestamps
    end
  end
end

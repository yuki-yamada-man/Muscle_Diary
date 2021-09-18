class CreateTrainingFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :training_favorites do |t|
      t.integer :user_id
      t.integer :training_id

      t.timestamps
    end
  end
end

class CreateTrainings < ActiveRecord::Migration[5.2]
  def change
    create_table :trainings do |t|
      t.integer :user_id
      t.string :menu, null: false
      t.float :kg, null: false
      t.integer :count, null: false
      t.integer :set
      t.date :date


      t.timestamps
    end
  end
end

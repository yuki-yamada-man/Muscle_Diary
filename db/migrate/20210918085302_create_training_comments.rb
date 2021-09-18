class CreateTrainingComments < ActiveRecord::Migration[5.2]
  def change
    create_table :training_comments do |t|

      t.timestamps
    end
  end
end

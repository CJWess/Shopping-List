class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.string :name, null: false
      t.integer :user_id, null: false

      t.timestamps null: false
    end
  end
end

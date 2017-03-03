class CreateMealsLists < ActiveRecord::Migration
  def change
    create_table :meals_lists do |t|
      t.integer :list_id, {null: false}
      t.integer :meal_id, {null: false}

      t.timestamps
    end
  end
end

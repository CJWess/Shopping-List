class CreateListItems < ActiveRecord::Migration
  def change
    create_table :list_items do |t|
      t.integer :ingredient_id, null: false
      t.integer :meal_id, null: false
      t.integer :quantity, null: false

      t.timestamps null: false
  end
  end
end

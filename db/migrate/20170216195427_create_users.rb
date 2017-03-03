class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, uniqueness: true
      t.string :hash_pass, null: false

      t.timestamps null: false
    end
  end
end

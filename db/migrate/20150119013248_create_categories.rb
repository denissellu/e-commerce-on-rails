class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :parent_id
      t.string :name 
      t.boolean :status
      t.boolean :visible_homepage
      t.timestamps null: false
    end
    add_index :categories, :name
  end
end

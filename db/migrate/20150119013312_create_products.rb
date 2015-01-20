class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :category
      t.string :name
      t.text :description
      t.string :image
      t.decimal :price ,:precision => 6, :scale => 2
      t.date :availability
      t.boolean :status
      t.timestamps null: false
    end
    add_index :products, :name
    add_index :products, :price
    add_index :products, :image
  end
end

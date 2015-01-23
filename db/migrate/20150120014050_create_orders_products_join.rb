class CreateOrdersProductsJoin < ActiveRecord::Migration
  def change
    create_table :orders_products do |t|
      t.integer :order_id
      t.integer :product_id
      t.integer :quantity
      t.decimal :price ,:precision => 6, :scale => 2
      
    end
    add_index :orders_products, :order_id
    add_index :orders_products, :product_id

  end
end

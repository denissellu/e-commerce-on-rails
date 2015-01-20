class CreateOrdersProductsJoin < ActiveRecord::Migration
  def change
    create_table :orders_products, :id => false do |t|
      t.integer 'order_id'
      t.integer 'product_id'
      t.integer 'quantity'
    end
    add_index :orders_products, :order_id
    add_index :orders_products, :product_id

  end
end

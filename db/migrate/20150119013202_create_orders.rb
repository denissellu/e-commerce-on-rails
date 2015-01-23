class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :user
      t.boolean :status
      t.decimal :total_price , :precision => 6, :scale => 2
      t.timestamps null: false
    end
    
  end
end
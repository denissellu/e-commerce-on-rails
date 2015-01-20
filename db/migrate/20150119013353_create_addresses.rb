class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :users
      t.text :address_field
      t.timestamps null: false
    end
  end
end

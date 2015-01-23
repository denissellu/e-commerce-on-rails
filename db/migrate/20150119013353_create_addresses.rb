class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :user
      t.string :first_name
      t.string :last_name
      t.text :address_field
      t.string :phone_number
      t.timestamps null: false
    end
  end
end

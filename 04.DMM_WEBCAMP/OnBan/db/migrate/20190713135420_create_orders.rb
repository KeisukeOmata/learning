class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.integer :payment
      t.integer :shipping_cost
      t.integer :shipping_status
      t.date :shipping_date
      t.integer :total_cost
      t.integer :postal_code
      t.string :street_address
      t.string :family_name
      t.string :first_name

      t.timestamps
    end
  end
end

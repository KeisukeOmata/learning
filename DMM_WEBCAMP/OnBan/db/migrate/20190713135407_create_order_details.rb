class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :order_id
      t.string :item_name
      t.integer :item_quantity
      t.integer :item_price

      t.timestamps
    end
  end
end

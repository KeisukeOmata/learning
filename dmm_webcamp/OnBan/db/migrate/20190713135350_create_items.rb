class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :label_id
      t.integer :category_id
      t.integer :artist_id
      t.text :item_name
      t.string :image_id
      t.integer :item_price
      t.integer :stocks
      t.integer :item_status

      t.timestamps
    end
  end
end

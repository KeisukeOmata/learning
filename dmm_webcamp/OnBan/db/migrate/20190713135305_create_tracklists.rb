class CreateTracklists < ActiveRecord::Migration[5.2]
  def change
    create_table :tracklists do |t|
      t.integer :disc_id
      t.string :track_name
      t.integer :song_order

      t.timestamps
    end
  end
end

class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :other_postal_code
      t.string :other_street_address
      t.string :receiver_user

      t.timestamps
    end
  end
end

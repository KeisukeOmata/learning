class AddReceiverUserToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :receiver_user, :string
  end
end

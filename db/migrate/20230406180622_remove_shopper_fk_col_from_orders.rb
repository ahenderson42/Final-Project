class RemoveShopperFkColFromOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :shopper_id
  end
end

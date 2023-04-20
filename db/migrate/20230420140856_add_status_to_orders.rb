class AddStatusToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :enum_status, :integer, default: 0
  end
end

class RemoveEmailFromShoppers < ActiveRecord::Migration[7.0]
  def change
    remove_column :shoppers, :email
  end
end

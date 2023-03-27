class ChangeNameInProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :name, :varchar
  end
end

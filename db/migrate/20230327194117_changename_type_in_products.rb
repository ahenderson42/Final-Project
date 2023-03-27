class ChangenameTypeInProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :name, :text
  end
end

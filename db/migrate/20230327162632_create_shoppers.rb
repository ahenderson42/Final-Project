class CreateShoppers < ActiveRecord::Migration[7.0]
  def change
    create_table :shoppers do |t|
      t.string :full_name
      t.string :email
      t.string :phone_number
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end

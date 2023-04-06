class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.string :email
      t.string :phone_number
      t.string :username
      t.string :password
      t.references :province, null: false, foreign_key: true

      t.timestamps
    end
  end
end

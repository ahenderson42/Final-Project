class AddTaxFieldsToProvinces < ActiveRecord::Migration[7.0]
  def change
    add_column :provinces, :pst, :float, default: 0
    add_column :provinces, :gst, :float, default: 0
    add_column :provinces, :hst, :float, default: 0
  end
end

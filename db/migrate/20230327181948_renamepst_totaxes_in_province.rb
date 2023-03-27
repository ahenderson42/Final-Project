class RenamepstTotaxesInProvince < ActiveRecord::Migration[7.0]
  def change
    rename_column :provinces, :pst, :taxes
  end
end

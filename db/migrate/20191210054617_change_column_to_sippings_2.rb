class ChangeColumnToSippings2 < ActiveRecord::Migration[5.2]
  def change
    change_column :shippings, :building, :string,null: true
  end
end

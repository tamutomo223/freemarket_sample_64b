class ChangeColumnToSippings < ActiveRecord::Migration[5.2]
  def change
    change_column :shippings, :building, :string
  end
end

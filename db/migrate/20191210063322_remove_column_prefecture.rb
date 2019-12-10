class RemoveColumnPrefecture < ActiveRecord::Migration[5.2]
  def change
    remove_column :shippings,:prefecture
  end
end

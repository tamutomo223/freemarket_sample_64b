class RemoveSellerFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :seller, :string
  end
end

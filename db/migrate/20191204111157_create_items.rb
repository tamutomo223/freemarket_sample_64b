class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :item_name,null: false
      t.string :seller,null: false
      t.integer :order_id,null: false,foreign_key: true
      t.integer :user_id,null: false,foreign_key: true
      t.string :explain,null: false
      t.string :status,null: false
      t.string :fee,null: false
      t.string :s_prefecture,null: false
      t.integer :s_date,null: false
      t.string :size,null: false
      t.string :size_type,null: false
      t.integer :category_id,null: false,foreign_key: true
      t.integer :brand_id,foreign_key: true
      t.integer :price,null: false
      t.integer :view
      t.timestamps
    end
  end
end

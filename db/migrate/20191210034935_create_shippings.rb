class CreateShippings < ActiveRecord::Migration[5.2]
  def change
    create_table :shippings do |t|
      t.string :s_family_name,null:false
      t.string :s_first_name,null:false
      t.string :s_kana_family_name,null:false
      t.string :s_kana_first_name,null:false
      t.string :address_number,null:false
      t.string :prefecture,null:false
      t.string :city,null:false
      t.string :town,null:false
      t.string :building,null:false
      t.string :s_tel
      t.references :user,null:false,foreign_key:true
      t.timestamps
    end
  end
end

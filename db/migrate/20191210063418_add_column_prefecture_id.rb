class AddColumnPrefectureId < ActiveRecord::Migration[5.2]
  def change
    add_column :shippings,:prefecture_id,:integer
  end
end

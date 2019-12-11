class ChangeDatatypeSDateOfItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :s_date, :string
  end
end

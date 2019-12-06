class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :burthday, :date, null: false
    add_column :users, :family_name, :string, null: false
    add_column :users, :first_name, :string, null: false
    add_column :users, :kana_family_name, :string, null: false
    add_column :users, :kana_first_name, :string, null: false
    add_column :users, :tel, :string, null: false
    add_column :users, :profile, :text
    add_column :users, :icon, :string
    add_column :users, :money, :integer
    add_column :users, :point, :integer
  end
end

class Shipping < ApplicationRecord
  validates :user_id, presence: true
  validates :s_family_name, presence: true
  validates :s_first_name, presence: true
  validates :s_kana_family_name, presence: true
  validates :s_kana_first_name, presence: true
  validates :address_number, presence: true
  validates :prefecture, presence: true
  validates :city, presence: true
  validates :town, presence: true
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
end
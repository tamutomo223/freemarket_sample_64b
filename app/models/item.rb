class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  belongs_to :category
  belongs_to :user

  validates :item_name, length: {maximum:40},presence: true
  validates :order_id,presence: true
  validates :user_id,presence: true
  validates :explain, length: {maximum:1000},presence: true
  validates :status,presence: true
  validates :fee,presence: true
  validates :s_prefecture,presence: true
  validates :s_date,presence: true 
  validates :price, numericality: {less_than_or_equal_to:9999999,greater_than_or_equal_to:300,only_integer: true}
  validates :view,presence: true
  validates :size,presence: true
  validates :size_type,presence: true
  validates :category_id,presence: true


  has_one :order

end


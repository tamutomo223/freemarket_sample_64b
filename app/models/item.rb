class Item < ApplicationRecord
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images
  belongs_to :category
  belongs_to :user
  belongs_to :order
end

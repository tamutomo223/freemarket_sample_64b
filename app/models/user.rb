class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, password_length: 7..128

  has_many :items
  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :kana_family_name, presence: true
  validates :kana_first_name, presence: true
  validates :birthday, presence: true
end

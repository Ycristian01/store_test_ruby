class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  has_many :orders, dependent: :destroy
  has_many :shipping_addresses, dependent: :destroy
  has_many :bought_products, through: :orders, source: :bought_products
end

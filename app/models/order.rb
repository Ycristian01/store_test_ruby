class Order < ApplicationRecord
  belongs_to :user
  has_many :bought_products

  validates :number, presence: true, uniqueness: true
end

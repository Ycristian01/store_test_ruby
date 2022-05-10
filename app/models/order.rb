class Order < ApplicationRecord
  belongs_to :user

  validates :number, presence: true, uniqueness: true
end
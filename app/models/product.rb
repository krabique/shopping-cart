class Product < ApplicationRecord
  validates :title, presence: true
  validates :image_url, presence: true
  validates :price, numericality: { only_integer: true, greater_than: 0 }

  has_many :carts_products, dependent: :destroy
end

class Product < ApplicationRecord
  validates :title, presence: true
  validates :image_url, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
end

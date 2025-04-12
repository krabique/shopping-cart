class CartsProduct < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  delegate :title, :image_url, :price, to: :product
end

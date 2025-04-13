class Cart < ApplicationRecord
  has_many :carts_products, dependent: :destroy
  has_many :products, through: :carts_products

  accepts_nested_attributes_for :carts_products
end

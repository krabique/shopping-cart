class Cart < ApplicationRecord
  before_save :recalculate_discount

  has_many :carts_products, dependent: :destroy
  has_many :products, through: :carts_products

  accepts_nested_attributes_for :carts_products

  validates :discount, numericality: { only_integer: true, in: 0..100 }, allow_nil: true

  def empty_cart
    carts_products.destroy_all
  end

  def total
    carts_products.joins(:product).sum("products.price * carts_products.quantity")
  end

  def discounted_total
    [total - (discount || 0), 0].max
  end

  def recalculate_discount
    return if discount.nil? || discount.zero?

    self.discount = total if discount > total
  end
end

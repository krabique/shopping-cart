class CartsProduct < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }

  delegate :title, :image_url, :price, to: :product

  after_save :trigger_cart_recalculation
  after_destroy :trigger_cart_recalculation

  private

  def trigger_cart_recalculation
    cart.recalculate_discount
    cart.save if cart.changed?
  end
end

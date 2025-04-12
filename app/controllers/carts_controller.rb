class CartsController < ApplicationController
  before_action :set_cart, only: %i[ update destroy ]

  def show
    @cart = Cart.includes(carts_products: :product).find(cart_id)
  end

  def update
    @cart.update(cart_params)
  end

  def destroy
    # @cart.cart_products.destroy_all
  end

  private

  def set_cart
    @cart = Cart.find(cart_id)
  end

  def cart_id
    @cart_id ||= params[:id] || Cart.first.id
  end

  def cart_params
    params.fetch(:cart, {})
  end
end

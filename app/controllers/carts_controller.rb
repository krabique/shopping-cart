class CartsController < ApplicationController
  before_action :set_cart, only: %i[ destroy ]

  def show
    @cart = Cart.includes(carts_products: :product).find(cart_id)
  end

  def destroy
    @cart.empty_cart
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @cart }
    end
  end

  private

  def set_cart
    @cart = Cart.find(cart_id)
  end

  def cart_id
    @cart_id ||= params[:id] || Cart.first.id
  end
end

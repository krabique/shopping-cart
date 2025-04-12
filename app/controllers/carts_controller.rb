class CartsController < ApplicationController
  before_action :set_cart, only: %i[ show update destroy ]

  def show
  end

  def update
    @cart.update(cart_params)
  end

  def destroy
    # @cart.cart_products.destroy_all
  end

  private

  def set_cart
    @cart = params[:id] ? Cart.find(params.exepect(:id)) : Cart.first
  end

  def cart_params
    params.fetch(:cart, {})
  end
end

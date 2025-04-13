class CartsController < ApplicationController
  before_action :set_cart, only: %i[ update destroy ]

  def show
    @cart = Cart.includes(carts_products: :product).find(cart_id)
  end

  def update
    if @cart.update(cart_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @cart, notice: "Cart updated." }
      end
    else
      respond_to do |format|
        format.html { redirect_to @cart, alert: "Failed to update cart." }
      end
    end
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

  def cart_params
    params.require(:cart).permit(:discount)
  end
end

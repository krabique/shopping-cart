class CartsProductsController < ApplicationController
  before_action :set_cart_and_product

  def update
    @carts_product.quantity += params[:change].to_i
    if @carts_product.quantity <= 0
      @carts_product.destroy
    else
      @carts_product.save
    end

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to cart_path(@cart) }
    end
  end

  def destroy
    @carts_product.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to cart_path(@cart) }
    end
  end

  private

  def set_cart_and_product
    @cart = Cart.find(params[:cart_id])
    @carts_product = @cart.carts_products.find(params[:id])
  end
end

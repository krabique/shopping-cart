require "rails_helper"

RSpec.describe Cart, type: :model do
  describe "#empty_cart" do
    it "removes all associated carts_products" do
      cart = create(:cart)
      create_list(:carts_product, 3, cart: cart)

      expect {
        cart.empty_cart
      }.to change(cart.carts_products, :count).from(3).to(0)
    end
  end

  describe "#total" do
    it "returns the total price of all cart items" do
      cart = create(:cart)
      product = create(:product, price: 10)
      create(:carts_product, cart: cart, product: product, quantity: 3)

      expect(cart.total).to eq(30)
    end
  end

  describe "#discounted_total" do
    it "applies the discount to the total" do
      cart = create(:cart)
      product = create(:product, price: 10)
      create(:carts_product, cart: cart, product: product, quantity: 2)
      cart.update!(discount: 5)

      expect(cart.discounted_total).to eq(15)
    end

    it "does not return a negative total" do
      cart = create(:cart)
      product = create(:product, price: 20)
      create(:carts_product, cart: cart, product: product, quantity: 2)
      cart.update!(discount: 50)

      expect(cart.discounted_total).to eq(0)
    end
  end

  describe "#recalculate_discount" do
    it "limits discount to the total if it's too high" do
      cart = create(:cart)
      product = create(:product, price: 50)
      create(:carts_product, cart: cart, product: product, quantity: 1)
      cart.update!(discount: 100)

      cart.save
      expect(cart.discount).to eq(50)
    end

    it "does not change discount if within valid range" do
      cart = create(:cart)
      product = create(:product, price: 50)
      create(:carts_product, cart: cart, product: product, quantity: 2)
      cart.update!(discount: 20)

      cart.save
      expect(cart.discount).to eq(20)
    end

    it "skips if discount is nil" do
      cart = create(:cart, discount: nil)
      expect { cart.save }.not_to raise_error
    end
  end
end

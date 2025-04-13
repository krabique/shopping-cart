require 'rails_helper'

RSpec.describe CartsProductsController, type: :controller do
  let!(:product) { create(:product) }
  let!(:cart) { create(:cart) }
  let(:carts_product) { create(:carts_product, cart: cart, product: product) }

  describe 'POST #create' do
    it 'adds the product to the cart and returns turbo_stream' do
      expect {
        post :create, params: { cart_id: cart.id, product_id: product.id }, as: :turbo_stream
      }.to change { cart.carts_products.count }.by(1)

      expect(response).to have_http_status(:ok)
      expect(response.media_type).to eq Mime[:turbo_stream]
    end
  end

  describe 'PATCH #update' do
    it 'increases quantity and returns turbo_stream' do
      expect {
        patch :update, params: { cart_id: cart.id, id: carts_product.id, change: 1 }, as: :turbo_stream
      }.to change { carts_product.reload.quantity }.by(1)

      expect(response).to have_http_status(:ok)
      expect(response.media_type).to eq Mime[:turbo_stream]
    end

    it 'removes product if quantity falls to 0 or below' do
      patch :update, params: { cart_id: cart.id, id: carts_product.id, change: -1 * carts_product.quantity }, as: :turbo_stream

      expect(response).to have_http_status(:ok)
      expect(response.media_type).to eq Mime[:turbo_stream]
      expect { carts_product.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'DELETE #destroy' do
    it 'removes the product from the cart and returns turbo_stream' do
      delete :destroy, params: { cart_id: cart.id, id: carts_product.id }, as: :turbo_stream

      expect(response).to have_http_status(:ok)
      expect(response.media_type).to eq Mime[:turbo_stream]
      expect { carts_product.reload }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end

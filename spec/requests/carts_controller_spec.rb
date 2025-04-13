require 'rails_helper'

RSpec.describe CartsController, type: :controller do
  let!(:cart) { create(:cart) }

  describe 'GET #show' do
    it 'returns an HTML response' do
      get :show, params: { id: cart.id }, as: :html
      expect(response).to have_http_status(:ok)
      expect(response.media_type).to eq Mime[:html]
    end
  end

  describe 'PATCH #update' do
    it 'updates the cart and returns turbo stream' do
      product = create(:product, price: 10)
      create(:carts_product, cart: cart, product: product, quantity: 1)

      patch :update, params: { id: cart.id, cart: { discount: 10 } }, as: :turbo_stream
      expect(response).to have_http_status(:ok)
      expect(response.media_type).to eq Mime[:turbo_stream]
      expect(cart.reload.discount).to eq(10)
    end
  end

  describe 'DELETE #destroy' do
    before { create(:carts_product, cart: cart) }

    it 'empties the cart and returns turbo stream' do
      delete :destroy, params: { id: cart.id }, as: :turbo_stream
      expect(response).to have_http_status(:ok)
      expect(response.media_type).to eq Mime[:turbo_stream]
      expect(cart.reload.carts_products).to be_empty
    end
  end
end

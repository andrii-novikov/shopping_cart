require 'rails_helper'

RSpec.describe ShoppingCart::CouponsController, type: :controller do
  routes {ShoppingCart::Engine.routes}

  describe 'PATCH #apply' do
    let(:coupon) { create(:coupon) }
    let(:order) { create(:order) }
    before do
      allow(controller).to receive(:current_order) { order }
    end
    it 'assigns coupon' do
      patch :apply, params: { coupon: { name: coupon.name } }
      expect(assigns(:coupon)).to eq coupon
    end

    it 'reditect to cart as :html' do
      patch :apply, params: { coupon: { name: coupon.name } }
      expect(response).to redirect_to cart_path
    end
  end
end

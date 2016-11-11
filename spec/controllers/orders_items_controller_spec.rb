require 'rails_helper'

RSpec.describe ShoppingCart::OrderItemsController, type: :controller do
  routes {ShoppingCart::Engine.routes}

  let(:order) { create(:order) }
  let(:product) { create(:product) }
  let(:order_item) { create(:order_item, product: product, order: order) }

  before { allow(controller).to receive(:current_order) { order } }

  describe 'POST create' do
    let(:action) do
      post :create, format: :json, params: {
        order_item: {
          product_id: product.id,
          count: 1
        }
      }
    end

    it 'increase order_items count' do
      expect { action }.to change { order.order_items.count }.by 1
    end
  end

  describe 'PUT update' do
    let(:action) do
      put :update, format: :json, params: {
        id: order_item.id,
        order_item: {
          count: 2
        }
      }
    end
    it 'update order item' do
      action
      expect(assigns(:order_item).count).to eq 2
    end
  end

  describe 'DELETE destroy' do
    let(:action) do
      delete :destroy, format: :json, params: {
        id: order_item.id
      }
    end
    it 'decrease order items count' do
      order.order_items << order_item
      expect { action }.to change { order.order_items.count }.by(-1)
    end
  end
end

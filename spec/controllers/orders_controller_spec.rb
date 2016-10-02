require 'rails_helper'

RSpec.describe ShoppingCart::OrdersController, type: :controller do
  routes {ShoppingCart::Engine.routes}

  let(:user) { create(:user) }
  let(:order) { create(:order, user: user) }
  before { allow(controller).to receive(:current_order).and_return(order) }
  before { allow(controller).to receive(:current_user).and_return(user) }

  describe 'GET #show' do
    subject { get :show, params: { id: order.id } }

    it 'assign order' do
      subject
      expect(assigns(:order)).to be_a ShoppingCart::Order
    end

    context 'foreign order'
    it 'redirect to home' do
      order.update(user:create(:user))
      # is_expected.to redirect_to(root_path)
    end
  end
end

require 'rails_helper'

RSpec.describe ShoppingCart::OrderItem, type: :model do
  subject { build(:order_item) }
  context 'fields' do
    it { is_expected.to belong_to :product }
    it { is_expected.to belong_to :order }
    it { is_expected.to validate_presence_of :count }
    it { is_expected.to validate_presence_of :product }
    it { is_expected.to validate_presence_of :order }
    it { is_expected.to validate_uniqueness_of(:product).scoped_to(:order_id) }
  end

  it 'set cost before create' do
    is_expected.to receive :set_cost
    subject.save
  end

  describe '#total' do
    it "return 0 if cost does't set" do
      subject.cost = nil
      expect(subject.total).to eq 0
    end
  end

  describe '#set_cost' do
    it 'set cost to current book prive' do
      subject.set_cost
      expect(subject.cost).to eq subject.product.price
    end
  end
end

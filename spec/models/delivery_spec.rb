require 'rails_helper'

RSpec.describe ShoppingCart::Delivery, type: :model do
  context 'fields' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :cost }
  end
end

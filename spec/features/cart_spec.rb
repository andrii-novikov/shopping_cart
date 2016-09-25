require 'rails_helper'

feature 'Cart' do
  context 'empty' do
    before { visit shopping_cart.cart_path }
    scenario 'see message empty cart' do
      expect(page).to have_content I18n.t('shopping_cart.carts.cart_content.empty')
    end
  end

  context 'with items' do
    let(:user) { create(:user) }
    let(:product) { create(:product) }

    context 'unregistered user' do
      scenario 'click on make order' do
        visit_cart_with(product)
        click_on I18n.t('shopping_cart.carts.cart_content.make-order')
        expect(page).to have_current_path(new_user_session_path)
      end
    end

    context 'registered user' do
      scenario 'click on make order', js: true do
        sign_in(user)
        visit_cart_with(product)
        click_on I18n.t('shopping_cart.carts.cart_content.make-order')
        expect(page).to have_css 'h1', text: 'Checkout'
      end
    end

    scenario 'delete item', js: true do
      visit_cart_with(product)
      find('.shopping_cart_order_item').find('[data-method=delete]').click
      accept_confirm do
        expect(page).to have_content I18n.t('shopping_cart.carts.cart_content.empty')
      end
    end

    scenario 'update item count', js: true, fix: true do
      visit_cart_with(product)
      within '.shopping_cart_order_item' do
        fill_in 'order_item[count]', with: 2
        # expect {find('[type=submit').click}.to change {find('.total').text}
        value = find('.total').text
        find('[type=submit]').click
        sleep 1
        expect(value).not_to eq find('.total').text
      end
    end

    context 'coupon' do
      before { visit_cart_with(product) }
      let(:coupon) { create(:coupon) }

      scenario 'add broken coupon' do
        fill_in 'coupon[name]', with: 'sale'
        find('.coupon [name=button]').click
        expect(page).to have_content I18n.t('shopping_cart.coupons.apply.invalid_coupon')
      end

      scenario 'add valid coupon' do
        fill_in 'coupon[name]', with: coupon.name
        find('.coupon [name=button]').click
        expect(page).to have_content I18n.t('shopping_cart.coupons.form.discount',
                                            discount: coupon.discount)
      end
    end
  end
end

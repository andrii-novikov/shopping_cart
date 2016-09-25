module ShoppingCart
  module FeaturesHelper
    def sign_in(user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_on 'Log in'
    end

    def add_product_to_cart(product)
      visit(product_path(product))
      click_add_to_cart
    end

    def click_add_to_cart
      within '#new_order_item' do
        find('[type=submit]').click
      end
    end

    def visit_cart_with(product)
      add_product_to_cart(product)
      sleep 1
      visit shopping_cart.cart_path
    end
  end
end

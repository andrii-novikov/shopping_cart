module ShoppingCart
  module CartsHelper
    def in_cart book
      current_order.order_items.map(&:product).include? book
    end

    def order_item
      ShoppingCart::OrderItem.new
    end

    def tab_header(name, title, enable = true, active = false)
      html_class = []
      html_class << 'active' if active
      html_class << 'disabled' unless enable
      options = {
          role: "presentation",
          class: html_class.join(' ')
      }
      result = content_tag('li', tab_href(title, name), options)
      result.html_safe
    end

    def tab_href(content, name)
      options = { href:"##{name}",
                  'aria-controls': name,
                  role: "tab",
                  'data-toggle': 'tab' }
      result = content_tag('a', content, options)
      result.html_safe
    end

    def add_to_cart_btn(product, tpl = 'shopping_cart/carts/add_btn')
      render tpl, product: product
    end

    def link_to_cart
      render 'layouts/shopping_cart/cart_text'
    end

    def link_to_orders
      render 'layouts/shopping_cart/orders_text'
    end

    def tab_content(name, active = false, &block)
      result = block.present? ? capture(&block) : ''
      html_class = "tab-pane fade"
      html_class += '-in active' if active
      options = { id: name,
                  role: 'tabpanel',
                  class: html_class }
      result = content_tag('div', result, options)
      result.html_safe
    end

    def checkout_form(step, &block)
      result = form_for @form, url: checkout_path, remote:true, html: {method: :put, class:'checkout_form'} do |f|
        concat(f.hidden_field 'step', value: step)
        concat(capture(f, &block))
        concat(render 'continue_btn', f:f)
      end
      result.html_safe
    end
  end
end

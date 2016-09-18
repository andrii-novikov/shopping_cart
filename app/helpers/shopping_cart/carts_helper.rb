module ShoppingCart
  module CartsHelper
    def in_cart book
      current_order.order_items.map(&:product).include? book
    end

    def order_item
      ShoppingCart::OrderItem.new
    end

    def tab_header(name, title, enable = true, active = false)
      result = <<HTML
  <li role="presentation" class="#{active ? 'active' : ''}#{enable ? '' : 'disabled'}">
    #{tab_href(title, name)}
  </li>
HTML
      result.html_safe
    end

    def tab_href(content, name)
      result = <<HTML
      <a href="##{name}" aria-controls="#{name}" role="tab" data-toggle='tab' >#{content}</a>
HTML
      result.html_safe
    end
  end
end

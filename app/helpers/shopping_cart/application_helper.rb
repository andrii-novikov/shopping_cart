module ShoppingCart
  module ApplicationHelper
    def icon(name)
      tag('span', class: "glyphicon glyphicon-#{name}")
    end

    def print_address(address)
      content_tag(:div) do
        content_tag(:div, address.full_name) +
            content_tag(:div, address.street) +
            content_tag(:div, address.city) +
            content_tag(:div, address.country.title) +
            content_tag(:div, "Phone: #{address.phone}")
      end
    end

    def print_credit_card(credit_card)
      content_tag(:div, "**** **** **** #{credit_card.number.to_s.last(4)}") +
          content_tag(:div,
                      "#{credit_card.expiration_month}/#{credit_card.expiration_year}")
    end

    def error_span(field)
      field = field.join(' ') if field.is_a? Array
      content_tag(:span,nil,class:"text-danger #{field}")
    end

    def shopping_cart_errors
      render('shopping_cart/shared/notice', message: notice) if notice.present?
      render('shopping_cart/shared/alert', message: flash[:alert]) if flash[:alert].present?
    end
  end
end

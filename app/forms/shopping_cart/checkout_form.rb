module ShoppingCart
  class CheckoutForm
    include ActiveModel::Model

    attr_accessor :order,
                  :step,
                  :billing_address_attributes,
                  :use_billing_address,
                  :shipping_address_attributes,
                  :credit_card_attributes,
                  :delivery_id

    delegate :use_billing_address,
             :delivery_id,
             :delivery,
             :errors,
             to: :order,
             allow_nil: true

    def save
      return order.make_order! if is_step?(:confirm)
      method = "#{step}_params"
      order.update(send(method)) if respond_to?(method)
    end

    def billing_address
      unless order.user.try(:billing_address)
        return order.billing_address || order.build_billing_address
      end
      order.billing_address_id.nil? ? order.user.billing_address.dup : order.billing_address
    end

    def shipping_address
      unless order.user.try(:shipping_address)
        return order.shipping_address || order.build_shipping_address
      end
      order.shipping_address_id.nil? ? order.user.shipping_address.dup : order.shipping_address
    end

    def credit_card
      unless order.user.try(:credit_card)
        return order.credit_card || order.build_credit_card
      end
      order.credit_card_id.nil? ? order.user.credit_card.dup : order.credit_card
    end

    def step
      @step.to_sym
    end

    def is_step?(name)
      step == name
    end

    def complited?
      order.awaiting_shipment?
    end

    def use_billing_address?
      @use_billing_address == '1'
    end

    def address_params
      params = { billing_address_attributes: billing_address_attributes,
                 use_billing_address: use_billing_address? }
      params.merge!(shipping_address_attributes: shipping_address_attributes) unless use_billing_address?
      params
    end

    def delivery_params
      { delivery_id: @delivery_id }
    end

    def payment_params
      { credit_card_attributes: credit_card_attributes }
    end
  end
end
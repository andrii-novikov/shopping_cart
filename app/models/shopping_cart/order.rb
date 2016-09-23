module ShoppingCart
  class Order < ApplicationRecord
    belongs_to :user, class_name: ShoppingCart.user_class
    belongs_to :delivery
    has_many :order_items, -> { order(created_at: :desc) }, dependent: :destroy

    validates :user, presence: true, unless: :in_progress?
    validates :billing_address_id, presence: true, unless: :in_progress?
    validates :shipping_address_id, presence: true, if: :validate_shipping?
    validates :delivery, presence: true, unless: :in_progress?
    validates :credit_card_id, presence: true, unless: :in_progress?
    validates :order_items, presence: true, unless: :in_progress?

    include ShoppingCart::Contactable

    if ShoppingCart.order_has_coupon
      include ShoppingCart::Discountable
    end

    TEMPORARY_LIVE_DURATION = 1.day

    delegate :empty?, to: :order_items
    before_save :set_total

    scope :temporary, -> {where('user_id is NULL AND created_at < ?', TEMPORARY_LIVE_DURATION.ago)}
    scope :for_admin, -> {where.not(status: :in_progress)}

    enum status: [:in_progress, :awaiting_shipment, :shipped, :completed, :cancelled]

    include AASM

    aasm column: :status, enum: true, whiny_transitions: false do
      state :in_progress, initial: true
      state :awaiting_shipment
      state :shipped
      state :completed
      state :cancelled

      event :make_order do
        transitions from: :in_progress, to: :awaiting_shipment
      end

      event :shipped do
        transitions from: :awaiting_shipment, to: :shipped
      end

      event :complete do
        transitions from: :shipped, to: :completed, success: :mark_complete
      end

      event :cancel do
        transitions from: [:in_progress, :awaiting_shipment, :shipped], to: :cancelled
      end
    end

    def mark_complete
      update(completed_at: Date.today)
    end

    def set_total
      self[:total] = total
    end

    def amount
      order_items.sum(&:total)
    end

    def subtotal
      return amount * discount if ShoppingCart.order_has_coupon
      amount
    end

    def total
      delivery.nil? ? subtotal : subtotal + delivery.cost
    end

    def union_with(other)
      other.order_items.each do |item|
        item.update_attribute(:order, self) unless contains(item.book)
      end
      other.reload.destroy
      self
    end

    def contains(book)
      !!order_items.find_by_book_id(book.id)
    end

    private

    def validate_shipping?
      !in_progress? && !use_billing_address
    end
  end
end

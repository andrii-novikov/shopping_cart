module ShoppingCart
  class CreditCard < ApplicationRecord
    NUMBER_FORMAT = /\d{16}/
    validates :number, presence: true
    validates :number, format: NUMBER_FORMAT
    validates :expiration_month, presence: true
    validates :expiration_year, presence: true
    validates :code, presence: true

    def self.months
      (1..12).to_a
    end

    def self.years
      now = Time.now.strftime('%y').to_i
      to = 20.years.since.strftime('%y').to_i
      (now..to).to_a
    end
  end
end

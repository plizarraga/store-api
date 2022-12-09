class Order < ApplicationRecord
  belongs_to :delivery_method
  has_many :order_items, dependent: :destroy

  validates_presence_of :buyer_email, :subtotal, :status,
    :ship_to_address_first_name, :ship_to_address_last_name, :ship_to_address_street,
    :ship_to_address_city, :ship_to_address_state, :ship_to_address_zipcode

  enum :status, { pending: 0, payment_received: 1, payment_failed: 2 }
end
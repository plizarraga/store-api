class DeliveryMethod < ApplicationRecord
    has_many :orders
    validates_presence_of :short_name, :description, :price, :delivery_time
end

class DeliveryMethod < ApplicationRecord
    validates :short_name, :description, :price, :delivery_time, presence: true
end

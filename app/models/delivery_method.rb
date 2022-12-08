class DeliveryMethod < ApplicationRecord
    validates_presence_of :short_name, :description, :price, :delivery_time
end

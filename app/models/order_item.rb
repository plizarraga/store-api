class OrderItem < ApplicationRecord
  belongs_to :order

  validates_presence_of :product_item_id, :product_item_name, :product_item_picture_url,
    :price, :quantity
end

class Product < ApplicationRecord
  belongs_to :product_type
  belongs_to :product_brand
end

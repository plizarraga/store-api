class Product < ApplicationRecord
  # Relationships
  belongs_to :product_type
  belongs_to :product_brand
  
  # Validations
  validates :name, presence: true  
  validates :description, presence: true  
end

class Product < ApplicationRecord
  # scope :c_order, -> { order(name: :asc) }

  # Relationships
  belongs_to :product_type
  belongs_to :product_brand
  
  # Validations
  validates :name, presence: true  
  validates :description, presence: true  

end

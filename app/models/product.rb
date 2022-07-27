class Product < ApplicationRecord
  scope :by_brand_id, ->(brand_id) { where(product_brand_id: brand_id) if brand_id.present? }
  scope :by_type_id, ->(type_id) { where(product_type_id: type_id) if type_id.present? }
  scope :by_name, ->(searchTerm) { where("name LIKE ?", "%#{searchTerm}%") if searchTerm.present? } 

  # Relationships
  belongs_to :product_type
  belongs_to :product_brand
  
  # Validations
  validates :name, presence: true  
  validates :description, presence: true  
  
  ORDER_BY = {
    nameAsc: "name ASC",
    nameDesc: "name DESC",
    priceAsc: "price ASC",
    priceDesc: "price DESC",
  }
end

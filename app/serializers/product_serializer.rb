class ProductSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  attributes :id, :name, :description, :price
  belongs_to :product_type
  belongs_to :product_brand
end

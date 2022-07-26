class ProductTypeSerializer
  include JSONAPI::Serializer
  set_key_transform :camel_lower
  attributes :id, :name
end

class ProductBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :description, :picture_url
  
  field :price do |product, options|
    product.price.to_f
  end

  association :product_type, blueprint: ProductTypeBlueprint
  association :product_brand, blueprint: ProductBrandBlueprint
end
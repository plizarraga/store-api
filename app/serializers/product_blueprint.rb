class ProductBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :description, :price, :picture_url

  association :product_type, blueprint: ProductTypeBlueprint
  association :product_brand, blueprint: ProductBrandBlueprint
end
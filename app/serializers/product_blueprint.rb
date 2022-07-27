class ProductBlueprint < Blueprinter::Base
    identifier :id
      
    fields :name, :description, :price
    association :product_type, blueprint: ProductTypeBlueprint
    association :product_brand, blueprint: ProductBrandBlueprint
  end
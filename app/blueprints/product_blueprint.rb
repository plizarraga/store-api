class ProductBlueprint < Blueprinter::Base
    identifier :id
      
    fields :name
    association :product_type, blueprint: ProductTypeBlueprint
    association :product_brand, blueprint: ProductBrandBlueprint
  end
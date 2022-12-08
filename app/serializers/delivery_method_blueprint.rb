class DeliveryMethodBlueprint < Blueprinter::Base
  identifier :id

  fields :short_name, :description, :delivery_time
  
  field :price do |product, options|
    product.price.to_f
  end
end
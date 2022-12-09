class OrderItemBlueprint < Blueprinter::Base
  identifier :id

  fields :product_item_id, :product_item_name,
    :product_item_picture_url, :quantity

  field :price do |order_item, options|
    order_item.price.to_f
  end
end
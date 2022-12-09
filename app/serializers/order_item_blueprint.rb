class OrderItemBlueprint < Blueprinter::Base
  field :product_item_id, name: :product_id
  field :product_item_name, name: :product_name
  field :product_item_picture_url, name: :picture_url
  field :quantity

  field :price do |order_item, options|
    order_item.price.to_f
  end
end
class OrderBlueprint < Blueprinter::Base
  identifier :id

  fields :buyer_email, :order_date, :status,
    :payment_intent_id, :delivery_method_id
  
  field :subtotal do |order, options|
    order.subtotal.to_f
  end

  field :shipToAddress do |order, options|
    {
      first_name: order.ship_to_address_first_name,
      last_name: order.ship_to_address_last_name,
      state: order.ship_to_address_state,
      city: order.ship_to_address_city,
      state: order.ship_to_address_state,
      zipcode: order.ship_to_address_last_name
    }
  end
  association :order_items, blueprint: OrderItemBlueprint
end
module OrderManager
    class CreateOrder < ApplicationService
        RETURNS = [
            SUCCESS = :success,
            FAILURE = :failure,
        ]

        def initialize(buyer_email, params)
            @buyer_email = buyer_email
            @params = params
        end

        def call
            # Get basket by id
            result = BasketManager::GetBasket.call(@params[:basket_id])
            
            return { status: FAILURE, error: result[:error] } unless result[:status] == :success

            # Calculate subtotal from order items
            subtotal = calculate_subtotal(result[:data]["items"])

            # Get delivery method
            delivery_method_id = get_delivery_method_id()

            # Create order
            order = Order.new({ 
                order_date: Time.now,
                buyer_email: @buyer_email,
                subtotal: subtotal,
                delivery_method_id: delivery_method_id,
                ship_to_address_first_name: @params["ship_to_address"]["first_name"],
                ship_to_address_last_name: @params["ship_to_address"]["last_name"],
                ship_to_address_state: @params["ship_to_address"]["state"],
                ship_to_address_city: @params["ship_to_address"]["city"],
                ship_to_address_street: @params["ship_to_address"]["street"],
                ship_to_address_zipcode: @params["ship_to_address"]["zipcode"],
                payment_intent_id: result[:data]["payment_intent_id"],
            })
            
            # Create order items
            order_items = []
            result[:data]["items"].each do | item |
                product = Product.find(item["id"])
                product = {
                    product_item_id: product.id,
                    product_item_name: product.name,
                    product_item_picture_url: product.picture_url,
                    price: product.price,
                    quantity: item["quantity"],
                }
                order_items.push(product)
            end

            order.order_items.build(order_items)

            # check if order exists
            order_exists = Order.find_by(payment_intent_id: result[:data]["payment_intent_id"])

            # delete order exists and create payment intent
            if order_exists.present?
                order_exists.destroy
                result = PaymentManager::CreateOrUpdatePaymentIntent.call(@params[:basket_id])
                return { status: FAILURE, errors: result[:error] } unless result[:status] == :success
            end

            # Create order
            if order.save
                { status: SUCCESS, data: order }

                # Delete basket by id after order created
                # result = BasketManager::DeleteBasket.call(@params[:basket_id])

                # if result[:status] == :success
                #   { status: SUCCESS, data: order }
                # else
                #   render json: { message: result[:error] }, status: :not_found
                # end
            else
                { status: FAILURE, error: order.errors.full_messages }
            end
        end

        private
        def calculate_subtotal(items)
            items.reduce(0) { |sum, item| sum + (item["quantity"] * item["price"]) }
        end 

        def get_delivery_method_id()
            @params["delivery_method_id"]
        end
    end
end
module PaymentManager
    class CreateOrUpdatePaymentIntent < ApplicationService
        RETURNS = [
            SUCCESS = :success,
            FAILURE = :failure,
        ]

        def initialize(basket_id)
            @basket_id = basket_id
        end

        def call
            # Get basket by id
            result = BasketManager::GetBasket.call(@basket_id)
            
            return { status: FAILURE, error: result[:error] } unless result[:status] == :success

            shipping_price = 0

            # set shipping price from delivery method
            if result[:data]["delivery_method_id"]
                delivery_method = DeliveryMethod.find(result[:data]["delivery_method_id"])
                shipping_price = delivery_method.price
            end

            # check product price
            result[:data]["items"].each do | item |
                product = Product.find(item["id"])
               
                if product.price != item["price"]
                    item["price"] = product.price.to_f
                end
            end

            # stripe create or update payment intent
            if !result[:data]["payment_intent"].blank?
                payment_intent = Stripe::PaymentIntent.create({
                    amount: calculate_subtotal(result[:data]["items"], shipping_price),
                    currency: 'usd',
                    payment_method_types: ['card'],
                  })
                  result[:data]["payment_intent_id"] = payment_intent.id
                  result[:data]["client_secret"] = payment_intent.client_secret
            else
                Stripe::PaymentIntent.update(
                    result[:data]["payment_intent_id"],
                    { amount: calculate_subtotal(result[:data]["items"], shipping_price) }
                )
            end

            # Update basket
            result = BasketManager::SetBasket.call(result[:data])

            if result[:status] == :success
              { status: SUCCESS, data: result[:data] }
            else
              { message: result[:error] }
            end
        end

        private
        def calculate_subtotal(items, shipping_price)
            (items.reduce(0) { |sum, item| sum + (item["quantity"] * (item["price"] * 100)) } + (shipping_price * 100)).to_i
        end 
    end
end
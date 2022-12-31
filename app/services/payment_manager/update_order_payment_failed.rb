module PaymentManager
  class UpdateOrderPaymentFailed < ApplicationService
    RETURNS = [
        SUCCESS = :success,
        FAILURE = :failure,
    ]

    def initialize(payment_intent_id)
        @payment_intent_id = payment_intent_id
    end

    def call
      order = Order.find_by(payment_intent_id: @payment_intent_id)      
      if order.payment_failed!
        { status: SUCCESS, data: order }
      else
        { status: FAILURE, error: order.errors.full_messages }
      end
    end
  end
end
class Api::V1::WebhooksController < Api::V1::BaseController
  skip_before_action :authorize_request, only: %i[ create ]

  def create
    payload = request.body.read
    sig_header = request.env['HTTP_STRIPE_SIGNATURE']
    event = nil

    begin
      event = Stripe::Webhook.construct_event(
        payload, sig_header, endpoint_secret
      )
    rescue JSON::ParserError => e
      # Invalid payload
      render json: { error: { message: e.message }}, status: :bad_request
      return
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      render json: { error: { message: e.message, extra: "Sig verification failed" }}, status: :bad_request
      return
    end

    # Handle the event
    case event.type
    when 'payment_intent.succeeded'
      payment_intent = event.data.object # contains a Stripe::PaymentIntent
      puts "Payment Intent Successful: #{payment_intent.id}"
      result = PaymentManager::UpdateOrderPaymentSucceeded.call(payment_intent.id)
      puts "Order updated to payment received: #{result[:data]["id"]}"
    when 'payment_intent.payment_failed'
      payment_intent = event.data.object # contains a Stripe::PaymentIntent
      puts "Payment Intent Failed: #{payment_intent.id}"
      result = PaymentManager::UpdateOrderPaymentFailed.call(payment_intent.id)
      puts "Order Failed: #{result[:data]["id"]}"
    else
      puts "Unhandled event type: #{event.type}"
    end

    render json: { message: :success }
    
    # if result[:status] == :success
    #   puts "Order updated to payment received: #{result[:data]["id"]}"
    #   render json: OrderBlueprint.render(result[:data]), status: :ok
    # else
    #   puts "Order Failed: #{result[:data]["id"]}"
    #   render json: { message: result[:error] }, status: :unprocessable_entity
    # end
  end
  
  private

  def endpoint_secret
    Rails.application.credentials.dig(:stripe, :endpoint_secret)
  end
end

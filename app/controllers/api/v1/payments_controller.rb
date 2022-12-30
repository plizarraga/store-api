class Api::V1::PaymentsController < Api::V1::BaseController
  before_action :snake_case_params, only: [:create]

  def create
    result = PaymentManager::CreateOrUpdatePaymentIntent.call(params[:basket_id])

    if result[:status] == :success
      render json: result[:data].deep_transform_keys! { |key| key.to_s.camelize(:lower) }, status: :created
    else
      render json: { errors: result[:error] }, status: :unprocessable_entity
    end
  end
  
  private
  # snake_case the query params and all other params
  def snake_case_params
    request.parameters.deep_transform_keys!(&:underscore)
  end
end

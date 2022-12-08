class Api::V1::DeliveryMethodsController < Api::V1::BaseController
  # GET /delivery_methods
  def index
    delivery_methods = DeliveryMethod.all

    render json: DeliveryMethodBlueprint.render(delivery_methods)
  end
end

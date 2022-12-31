class Api::V1::OrdersController < Api::V1::BaseController
  before_action :snake_case_params, only: [:create]
  before_action :set_order, only: %i[ show ]

  # GET /orders
  def index
    @orders = Order
                .includes(:delivery_method, :order_items)
                .where(buyer_email: @current_user.email)
                .order(created_at: :desc)

    render json: OrderBlueprint.render(@orders)
  end

  # GET /orders/1
  def show
    render json: OrderBlueprint.render(@order)
  end

  # POST /orders
  def create
    buyer_email = @current_user.email
    result = OrderManager::CreateOrder.call(buyer_email, params)

    if result[:status] == :success
      render json: OrderBlueprint.render(result[:data]), status: :created
    else
      render json: { message: result[:error] }, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find_by({ id: params[:id], buyer_email: @current_user.email })
    end

    # Only allow a list of trusted parameters through.
    # def order_params
    #   params.require(:order).permit(:buyer_email, :order_date, :ship_to_address_first_name, :ship_to_address_last_name, :ship_to_address_street, :ship_to_address_city, :ship_to_address_state, :ship_to_address_zipcode, :delivery_methods_id, :subtotal, :status, :payment_intent_id)
    # end

    # snake_case the query params and all other params
    def snake_case_params
      request.parameters.deep_transform_keys!(&:underscore)
    end
end

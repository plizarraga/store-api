class Api::V1::ProductTypesController < Api::V1::BaseController
  skip_before_action :authorize_request, only: [:index, :show]
  before_action :set_product_type, only: %i[ show update ]

  def index
    @product_types = ProductType.all

    render json: ProductTypeBlueprint.render(@product_types)
  end

  def show
    render json: ProductTypeBlueprint.render(@product_type)
  end

  private
    def set_product_type
      @product_type = ProductType.find(params[:id])
    end
end

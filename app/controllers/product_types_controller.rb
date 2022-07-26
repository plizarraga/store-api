class ProductTypesController < ApplicationController
  before_action :set_product_type, only: %i[ show update ]

  def index
    @product_types = ProductType.all

    render json: ProductTypeSerializer.new(@product_types)
  end

  def show
    render json: ProductTypeSerializer.new(@product_type)
  end

  private
    def set_product_type
      @product_type = ProductType.find(params[:id])
    end
end

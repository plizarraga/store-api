class ProductTypesController < ApplicationController
  before_action :set_product_type, only: %i[ show update ]

  def index
    @products = ProductType.all

    render json: @products
  end

  def show
    render json: @product
  end

  private
    def set_product_type
      @product = ProductType.find(params[:id])
    end
end

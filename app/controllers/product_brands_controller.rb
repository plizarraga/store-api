class ProductBrandsController < ApplicationController
  before_action :set_product_brand, only: %i[ show update ]

  def index
    @products = ProductBrand.all

    render json: @products
  end

  def show
    render json: @product
  end

  private
    def set_product_brand
      @product = ProductBrand.find(params[:id])
    end
end

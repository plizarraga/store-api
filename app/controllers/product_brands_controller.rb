class ProductBrandsController < ApplicationController
  before_action :set_product_brand, only: %i[ show update ]

  def index
    @product_brands = ProductBrand.all

    render json: ProductBrandSerializer.new(@product_brands)
  end

  def show
    render json: ProductBrandSerializer.new(@product_brand)
  end

  private
    def set_product_brand
      @product_brand = ProductBrand.find(params[:id])
    end
end

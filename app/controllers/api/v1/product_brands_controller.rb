class Api::V1::ProductBrandsController < Api::V1::BaseController
  before_action :set_product_brand, only: %i[ show update ]

  def index
    @product_brands = ProductBrand.all

    render json: ProductBrandBlueprint.render(@product_brands)
  end

  def show
    render json: ProductBrandBlueprint.render(@product_brand)
  end

  private
    def set_product_brand
      @product_brand = ProductBrand.find(params[:id])
    end
end

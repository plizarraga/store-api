class Api::V1::ProductsController < ApplicationController
  before_action :set_product, only: %i[ show update destroy ]

  def index
    @products = Product.includes(:product_type, :product_brand)

    render json: ProductBlueprint.render(@products)
  end

  def show
    render json: ProductBlueprint.render(@product)
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
  end

  private
    def set_product
      @product = Product.includes(:product_type, :product_brand).find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :product_type_id, :product_brand_id)
    end
end

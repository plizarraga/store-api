class Api::V1::ProductsController < Api::V1::BaseController
  before_action :set_product, only: %i[ show update destroy ]
  
  def index
    @products = Product.includes(:product_type, :product_brand).order(set_order_options(params[:sort]))

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

    def set_order_options(sort)
      sortOptions = { name: :asc}
      if sort
        case sort
        when "nameDesc"
          sortOptions = { name: :desc}
        when "nameAsc"
          sortOptions = { name: :asc}
        when "priceDesc"
          sortOptions = { price: :desc}
        when "priceAsc"
          sortOptions = { price: :asc}
        end
      end
      sortOptions
    end
end

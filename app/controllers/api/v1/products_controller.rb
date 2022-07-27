class Api::V1::ProductsController < Api::V1::BaseController
  before_action :set_product, only: %i[ show update destroy ]
  
  def index
    pageSize = 5
    if params[:pageSize].present?
      pageSize = params[:pageSize].to_i > 5 ? 5 : params[:pageSize].to_i
    end

    pageIndex = params[:pageIndex].present? ? params[:pageIndex].to_i : 0

    @products = Product.includes(:product_type, :product_brand)
      .by_name(params[:search])
      .by_brand_id(params[:brandId])
      .by_type_id(params[:typeId])
      .order(set_order_options)
    
    total_records = @products.count
    
    @paged_records = @products.limit(pageSize.to_i).offset(pageIndex.to_i * pageSize.to_i)


    render json: ProductBlueprint.render(@paged_records, root: :data, meta: { count: total_records, pageIndex: pageIndex, pageSize: pageSize})
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

    def set_order_options
      Product::ORDER_BY.fetch(params[:sort]&.to_sym, Product::ORDER_BY[:nameAsc])
    end

    def set_categories_filter
      product_brand_id = params[:brandId] 
      product_type_id = params[:typeId] 
      filter_options = nil
      if product_brand_id
        filter_options += "product_brand_id d"
      end
    end
end

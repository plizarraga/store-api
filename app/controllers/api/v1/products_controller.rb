class Api::V1::ProductsController < Api::V1::BaseController
  before_action :set_product, only: %i[ show ]
  
  def index
    page_max_size = 6
    pageSize = page_max_size

    if params[:pageSize].present?
      pageSize = params[:pageSize].to_i > 6 ? page_max_size : params[:pageSize].to_i
    end

    page_index = params[:pageIndex].present? ? (params[:pageIndex].to_i - 1) : 0
    
    products = FindProducts.new.call(params)
    
    total_records = products.count
    
    @paged_records = products.limit(pageSize.to_i).offset(page_index.to_i * pageSize.to_i)

    page_index = page_index + 1

    render json: ProductBlueprint.render(@paged_records, root: :data, meta: { count: total_records, pageIndex: page_index, pageSize: pageSize})
  end

  def show
    render json: ProductBlueprint.render(@product)
  end

  private
    def set_product
      @product = Product.includes(:product_type, :product_brand).find(params[:id])
    end
end

class Api::V1::ProductsController < Api::V1::BaseController
  before_action :set_product, only: %i[ show ]
  
  def index
    pageSize = 5
    if params[:pageSize].present?
      pageSize = params[:pageSize].to_i > 5 ? 5 : params[:pageSize].to_i
    end

    pageIndex = params[:pageIndex].present? ? params[:pageIndex].to_i : 0
    
    products = FindProducts.new.call(params)
    
    total_records = products.count
    
    @paged_records = products.limit(pageSize.to_i).offset(pageIndex.to_i * pageSize.to_i)


    render json: ProductBlueprint.render(@paged_records, root: :data, meta: { count: total_records, pageIndex: pageIndex, pageSize: pageSize})
  end

  def show
    render json: ProductBlueprint.render(@product)
  end

  private
    def set_product
      @product = Product.includes(:product_type, :product_brand).find(params[:id])
    end
end

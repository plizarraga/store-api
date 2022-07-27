class FindProducts
    attr_reader :products

    def initialize(products = initial_scope)
        @products = products
    end

    def call(params = {})
        scoped = products
        scoped = find_by_type_id(scoped, params[:brandId])
        scoped = find_by_brand_id(scoped, params[:typeId])
        scoped = find_by_name(scoped, params[:search])
        order_by(scoped, params[:sort])
    end

    private
    def initial_scope
        Product.includes(:product_type, :product_brand)
    end

    def find_by_type_id(scoped, typeId)
        return scoped unless typeId.present?
        scoped.where(product_type_id: typeId)
    end
    
    def find_by_brand_id(scoped, brandId)
        return scoped unless brandId.present?
        scoped.where(product_brand_id: brandId)
    end

    def find_by_name(scoped, searchTerm)
        return scoped unless searchTerm.present?
        scoped.where("lower(name) LIKE ?", "%#{searchTerm.downcase}%")
    end

    def order_by(scoped, sort)
        order_by_query = Product::ORDER_BY.fetch(sort&.to_sym, Product::ORDER_BY[:nameAsc])
        scoped.order(order_by_query)
    end
end
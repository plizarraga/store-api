class BasketItem
    include ActiveModel::API
    attr_accessor :id, :name, :product_name, :price, :quantity, :picture_url, :brand, :type
    validates :id, :name, :product_name, :price, :quantity, :picture_url, :brand, :type, presence: true

    # def deliver
    #     if valid?
    #     # deliver email
    #     end
    # end
end

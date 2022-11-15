class Basket
    include ActiveModel::API
    attr_accessor :id, :items
    validates :id, presence: true
end

# b = Basket.create(id: 1, basket_items: [])

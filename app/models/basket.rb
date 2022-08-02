class Basket
    include ActiveModel::API
    validates :id, presence: true
    attr_accessor :id, :items

    # def initialize(id)
    #     self.id
    #     self.items = [] # on object creation initialize this to an array
    # end
    # def deliver
    #     if valid?
    #     # deliver email
    #     end
    # end
end

# b = Basket.create(id: 1, basket_items: [])

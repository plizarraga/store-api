module OrderManager
    class CreateBasket < ApplicationService
        RETURNS = [
            SUCCESS = :success,
            FAILURE = :failure,
        ]

        def initialize(params)
            @params = params
        end

        def call
            
        end
    end
end
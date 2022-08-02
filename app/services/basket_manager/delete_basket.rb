module BasketManager
    class DeleteBasket < ApplicationService
        RETURNS = [
            SUCCESS = :success,
            FAILURE = :failure,
        ]

        def initialize(id)
            @id = id
        end

        def call
            begin
                redis = Redis.new
                result = redis.del(@id)

                return { status: FAILURE, error: "Basket not found" } if result == 0
                return { status: SUCCESS, data: {} }
            rescue StandardError => e
                # => #<Redis::CannotConnectError: Timed out connecting to Redis on 10.0.1.1:6380>
                # puts e.inspect

                # => Timed out connecting to Redis on 10.0.1.1:6380
                # puts e.message
                e.message
                { status: FAILURE, error: e.message }
            end
        end
    end
end

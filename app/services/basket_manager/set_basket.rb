module BasketManager
    class SetBasket < ApplicationService
        RETURNS = [
            SUCCESS = :success,
            FAILURE = :failure,
        ]

        def initialize(params)
            @params = params
        end

        def call
            begin
                basket = BasketSchema::Schema.call(@params.to_h)
                return { status: FAILURE, error: basket.errors.to_h } unless basket.success?

                redis = Redis.new
                result = redis.set(@params["id"], @params.to_json)

                return { status: FAILURE, error: "Error trying to save basket" } unless "OK"
                { status: SUCCESS, data: @params }
            rescue StandardError => e
                # => #<Redis::CannotConnectError: Timed out connecting to Redis on 10.0.1.1:6380>
                # puts e.inspect

                # => Timed out connecting to Redis on 10.0.1.1:6380
                # puts e.message
                { status: FAILURE, error: e.message }
            end
        end
    end
end
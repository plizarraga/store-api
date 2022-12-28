module BasketManager
    class GetBasket < ApplicationService
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
                result = redis.get(@id)

                return { status: FAILURE, error: "Basket not found" } unless result.present?
                return { status: SUCCESS, data: JSON.parse(result).deep_transform_keys! { |key| key.to_s.camelize(:lower) } }
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
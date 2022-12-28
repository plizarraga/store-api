module BasketSchema
	require 'dry-schema'

	Schema = Dry::Schema.Params do
		required(:id).filled(:string)
		required(:items).value(:array, min_size?: 1).each do
			hash do
				required(:id).filled(:integer)
				required(:product_name).filled(:string)
				required(:price).filled(:integer, gteq?: 0.1)
				required(:quantity).filled(:int?, gteq?: 1)
				required(:picture_url).filled(:string)
				required(:brand).filled(:string)
				required(:type).filled(:string)
			end
		end
		optional(:delivery_method_id).filled(:integer)
		optional(:client_secret).filled(:string)
		optional(:payment_intent_id).filled(:string)
	end
end
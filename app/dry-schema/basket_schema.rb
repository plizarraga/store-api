module BasketSchema
	require 'dry-schema'

	Schema = Dry::Schema.Params do
		required(:id).filled(:string)
		required(:items).value(:array, min_size?: 1).each do
			hash do
				required(:id).filled(:integer)
				required(:productName).filled(:string)
				required(:price).filled(:integer, gteq?: 0.1)
				required(:quantity).filled(:int?, gteq?: 1)
				required(:pictureUrl).filled(:string)
				required(:brand).filled(:string)
				required(:type).filled(:string)
			end
		end
	end
end
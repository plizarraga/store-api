require 'oj'
require_relative '../../app/serializers/transformers/lower_camel_transformer.rb'

Blueprinter.configure do |config|
  config.generator = Oj # default is JSON
  config.default_transformers = [LowerCamelTransformer]
  config.sort_fields_by = :definition
end
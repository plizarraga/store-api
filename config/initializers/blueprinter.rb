require 'oj' # you can skip this if OJ has already been required.
class LowerCamelTransformer < Blueprinter::Transformer
    def transform(hash, _object, _options)
      hash.transform_keys! { |key| key.to_s.camelize(:lower).to_sym }
    end
end

Blueprinter.configure do |config|
  config.generator = Oj # default is JSON
  config.default_transformers = [LowerCamelTransformer]
end
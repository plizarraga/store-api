# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# 10.times do
#     ProductBrand.create(name: Faker::Commerce.unique.brand)
# end

# [
#     { "Name": "Boards" },
#     { "Name": "Hats" },
#     { "Name": "Boots" },
#     { "Name": "Gloves" }
# ].each do |item|
#     ProductType.create(name: item[:Name])
# end

# 100.times do
#     Product.create(
#         name: Faker::Commerce::unique.product_name, 
#         description: Faker::Lorem.paragraph, 
#         price: Faker::Commerce.price(range: 5..500.0), 
#         product_type: ProductType.find(ProductType.pluck(:id).sample), 
#         product_brand: ProductBrand.find(ProductBrand.pluck(:id).sample)
#     )
# end
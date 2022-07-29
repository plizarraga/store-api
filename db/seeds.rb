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

# Product Types
# [
#     { "id": 1, "name": "Boards" },
#     { "id": 2, "name": "Hats" },
#     { "id": 3, "name": "Boots" },
#     { "id": 4, "name": "Gloves" }
# ].each do |item|
#     ProductType.create(id: item[:id], name: item[:name])
# end

# Product brans
# [
#     { "id": 1, "name": "Angular" },
#     { "id": 2, "name": "NetCore" },
#     { "id": 3, "name": "VS Code" },
#     { "id": 4, "name": "React" },
#     { "id": 5, "name": "Typescript" },
#     { "id": 6, "name": "Redis" }
# ].each do |item|
#     ProductBrand.create(id: item[:id], name: item[:name])
# end

# Products
[
    {
      "name": "Angular Speedster Board 2000",
      "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.",
      "price": 200,
      # "picture_url": "images/products/sb-ang1.png",
      "picture_url": "https://via.placeholder.com/300/09f/fff.png",
      "product_type_id": 1,
      "product_brand_id": 1
    },
    {
      "name": "Green Angular Board 3000",
      "description": "Nunc viverra imperdiet enim. Fusce est. Vivamus a tellus.",
      "price": 150,
      # "picture_url": "images/products/sb-ang2.png",
      "picture_url": "https://via.placeholder.com/300/09f/fff.png",
      "product_type_id": 1,
      "product_brand_id": 1
    },
    {
      "name": "Core Board Speed Rush 3",
      "description": "Suspendisse dui purus, scelerisque at, vulputate vitae, pretium mattis, nunc. Mauris eget neque at sem venenatis eleifend. Ut nonummy.",
      "price": 180,
      # "picture_url": "images/products/sb-core1.png",
      "picture_url": "https://via.placeholder.com/300/09f/fff.png",
      "product_type_id": 1,
      "product_brand_id": 2
    },
    {
      "name": "Net Core Super Board",
      "description": "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci.",
      "price": 300,
      # "picture_url": "images/products/sb-core2.png",
      "picture_url": "https://via.placeholder.com/300/09f/fff.png",
      "product_type_id": 1,
      "product_brand_id": 2
    },
    {
      "name": "React Board Super Whizzy Fast",
      "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.",
      "price": 250,
      # "picture_url": "images/products/sb-react1.png",
      "picture_url": "https://via.placeholder.com/300/09f/fff.png",
      "product_type_id": 1,
      "product_brand_id": 4
    },
    {
      "name": "Typescript Entry Board",
      "description": "Aenean nec lorem. In porttitor. Donec laoreet nonummy augue.",
      "price": 120,
      # "picture_url": "images/products/sb-ts1.png",
      "picture_url": "https://via.placeholder.com/300/09f/fff.png",
      "product_type_id": 1,
      "product_brand_id": 5
    },
    {
      "name": "Core Blue Hat",
      "description": "Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.",
      "price": 10,
      # "picture_url": "images/products/hat-core1.png",
      "picture_url": "https://via.placeholder.com/300/09f/fff.png",
      "product_type_id": 2,
      "product_brand_id": 2
    },
    {
      "name": "Green React Woolen Hat",
      "description": "Suspendisse dui purus, scelerisque at, vulputate vitae, pretium mattis, nunc. Mauris eget neque at sem venenatis eleifend. Ut nonummy.",
      "price": 8,
      # "picture_url": "images/products/hat-react1.png",
      "picture_url": "https://via.placeholder.com/300/09f/fff.png",
      "product_type_id": 2,
      "product_brand_id": 4
    },
    {
      "name": "Purple React Woolen Hat",
      "description": "Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.",
      "price": 15,
      # "picture_url": "images/products/hat-react2.png",
      "picture_url": "https://via.placeholder.com/300/09f/fff.png",
      "product_type_id": 2,
      "product_brand_id": 4
    },
    {
      "name": "Blue Code Gloves",
      "description": "Nunc viverra imperdiet enim. Fusce est. Vivamus a tellus.",
      "price": 18,
      # "picture_url": "images/products/glove-code1.png",
      "picture_url": "https://via.placeholder.com/300/09f/fff.png",
      "product_type_id": 4,
      "product_brand_id": 3
    },
    {
      "name": "Green Code Gloves",
      "description": "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci.",
      "price": 15,
      # "picture_url": "images/products/glove-code2.png",
      "picture_url": "https://via.placeholder.com/300/09f/fff.png",
      "product_type_id": 4,
      "product_brand_id": 3
    },
    {
      "name": "Purple React Gloves",
      "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa.",
      "price": 16,
      # "picture_url": "images/products/glove-react1.png",
      "picture_url": "https://via.placeholder.com/300/09f/fff.png",
      "product_type_id": 4,
      "product_brand_id": 4
    },
    {
      "name": "Green React Gloves",
      "description": "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci.",
      "price": 14,
      # "picture_url": "images/products/glove-react2.png",
      "picture_url": "https://via.placeholder.com/300/09f/fff.png",
      "product_type_id": 4,
      "product_brand_id": 4
    },
    {
      "name": "Redis Red Boots",
      "description": "Suspendisse dui purus, scelerisque at, vulputate vitae, pretium mattis, nunc. Mauris eget neque at sem venenatis eleifend. Ut nonummy.",
      "price": 250,
      # "picture_url": "images/products/boot-redis1.png",
      "picture_url": "https://via.placeholder.com/300/09f/fff.png",
      "product_type_id": 3,
      "product_brand_id": 6
    },
    {
      "name": "Core Red Boots",
      "description": "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Maecenas porttitor congue massa. Fusce posuere, magna sed pulvinar ultricies, purus lectus malesuada libero, sit amet commodo magna eros quis urna.",
      "price": 189.99,
      # "picture_url": "images/products/boot-core2.png",
      "picture_url": "https://via.placeholder.com/300/09f/fff.png",
      "product_type_id": 3,
      "product_brand_id": 2
    },
    {
      "name": "Core Purple Boots",
      "description": "Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin pharetra nonummy pede. Mauris et orci.",
      "price": 199.99,
      # "picture_url": "images/products/boot-core1.png",
      "picture_url": "https://via.placeholder.com/300/09f/fff.png",
      "product_type_id": 3,
      "product_brand_id": 2
    },
    {
      "name": "Angular Purple Boots",
      "description": "Aenean nec lorem. In porttitor. Donec laoreet nonummy augue.",
      "price": 150,
      # "picture_url": "images/products/boot-ang2.png",
      "picture_url": "https://via.placeholder.com/300/09f/fff.png",
      "product_type_id": 3,
      "product_brand_id": 1
    },
    {
      "name": "Angular Blue Boots",
      "description": "Suspendisse dui purus, scelerisque at, vulputate vitae, pretium mattis, nunc. Mauris eget neque at sem venenatis eleifend. Ut nonummy.",
      "price": 180,
      # "picture_url": "images/products/boot-ang1.png",
      "picture_url": "https://via.placeholder.com/300/09f/fff.png",
      "product_type_id": 3,
      "product_brand_id": 1
    }
].each do |item|
    Product.create(
        name: item[:name],
        description: item[:description],
        price: item[:price],
        picture_url: item[:picture_url],
        product_type_id: item[:product_type_id],
        product_brand_id: item[:product_brand_id]
    )
end


# 100.times do
#     Product.create(
#         name: Faker::Commerce::unique.product_name, 
#         description: Faker::Lorem.paragraph, 
#         price: Faker::Commerce.price(range: 5..500.0), 
#         picture_url: "https://source.unsplash.com/random/200x200?sig=1",
#         product_type: ProductType.find(ProductType.pluck(:id).sample), 
#         product_brand: ProductBrand.find(ProductBrand.pluck(:id).sample)
#     )
# end
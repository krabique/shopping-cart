# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

[
  {
    title: 'Wireless speaker, Goodyear',
    price: 100,
    image_url: 'wireless-speaker.png'
  },
  {
    title: "Women's Home Suit, Sweet Dreams",
    price: 25,
    image_url: 'pajamas.png'
  },
  {
    title: "Raincoat, SwissOak",
    price: 50,
    image_url: 'raincoat.png'
  }
].each do |product|
  Product.create!(title: product[:title], price: product[:price], image_url: product[:image_url])
end


carts_products_attributes = Product.all.map.with_index do |product, index|
  { product: product, quantity: index + 1 }
end

Cart.create!(carts_products_attributes: carts_products_attributes)

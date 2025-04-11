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
    title: 'Wireless speaker',
    price: 100,
    image_url: 'wireless-speaker.jpg'
  }
].each do |product|
  Product.create!(title: product[:title], price: product[:price], image_url: product[:image_url])
end

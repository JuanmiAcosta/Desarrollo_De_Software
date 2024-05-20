# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb
pedido = Pedido.create!(idPedido: "123", precio: 25.0, listo: false, usuario:"juanmi")

Hamburguesa.create!(
  nombre: "Hamburguesa Clásica",
  tomate: "Sí",
  quesoCabra: "No",
  cebolla: "Sí",
  pepinillos: "Sí",
  bacon: "No",
  carne: "Res",
  precio: 5.99,
  pedido: pedido
)

Hamburguesa.create!(
  nombre: "Hamburguesa Bacon",
  tomate: "Sí",
  quesoCabra: "Sí",
  cebolla: "No",
  pepinillos: "Sí",
  bacon: "Sí",
  carne: "Res",
  precio: 7.99,
  pedido: pedido
)


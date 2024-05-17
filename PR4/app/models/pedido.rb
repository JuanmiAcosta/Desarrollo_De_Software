class Pedido < ApplicationRecord
  has_many :Hamburguesa, inverse_of: :Pedido
  accepts_nested_attributes_for :Hamburguesa
end

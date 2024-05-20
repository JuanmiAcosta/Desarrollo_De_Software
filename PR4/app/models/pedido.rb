class Pedido < ApplicationRecord
    has_many :hamburguesas, dependent: :destroy
    accepts_nested_attributes_for :hamburguesas
    #Permite gestionar hamburguesas a la vez que pedidos
end

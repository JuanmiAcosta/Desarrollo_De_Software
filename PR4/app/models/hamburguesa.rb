class Hamburguesa < ApplicationRecord
  belongs_to :pedido
  validates :pedido_id, presence: true 
  #Obliga a que no se pueda guardar una hamburguesa sin su pedido_id y 
  #siempre tiene que esta estar asociada a un pedido, 
  #ademas sino le asignas el pedido_id a la hamburguesa salta un error de rails
end

class RemoveHamburguesasFromPedido < ActiveRecord::Migration[6.0]
  def change
    remove_reference :pedidos, :hamburguesas
  end
end

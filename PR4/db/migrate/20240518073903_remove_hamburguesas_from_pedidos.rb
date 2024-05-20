class RemoveHamburguesasFromPedidos < ActiveRecord::Migration[7.1]
  def change
    remove_column :pedidos, :hamburguesas, :string
  end
end

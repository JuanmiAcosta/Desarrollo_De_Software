class ChangePedidoIdInHamburguesas < ActiveRecord::Migration[7.1]
  def change
    remove_index :hamburguesas, :Pedido_id
    rename_column :hamburguesas, :Pedido_id, :pedido_id
    add_index :hamburguesas, :pedido_id
    remove_foreign_key :hamburguesas, :Pedidos
    add_foreign_key :hamburguesas, :pedidos
  end
end
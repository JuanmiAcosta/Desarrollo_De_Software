class AddHamburguesasToPedidos < ActiveRecord::Migration[7.1]
  def change
    add_column :pedidos, :hamburguesas, :string
  end
end

class CreatePedidos < ActiveRecord::Migration[7.1]
  def change
    create_table :pedidos do |t|
      t.string :idPedido
      t.string :usuario
      t.float :precio
      t.boolean :listo

      t.timestamps
    end
  end
end

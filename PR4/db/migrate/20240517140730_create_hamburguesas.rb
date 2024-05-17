class CreateHamburguesas < ActiveRecord::Migration[7.1]
  def change
    create_table :hamburguesas do |t|
      t.string :pan
      t.string :nombre
      t.string :tomate
      t.string :quesoCabra
      t.string :cebolla
      t.string :pepinillos
      t.string :bacon
      t.string :carne
      t.float :precio
      t.references :Pedido, null: false, foreign_key: true

      t.timestamps
    end
  end
end

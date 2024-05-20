class AddLechugaToHamburguesas < ActiveRecord::Migration[7.1]
  def change
    add_column :hamburguesas, :lechuga, :string
  end
end

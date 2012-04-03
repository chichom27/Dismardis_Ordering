class CreateEstadoPedidos < ActiveRecord::Migration
  def change
    create_table :estado_pedidos do |t|
      t.string :Nombre

      t.timestamps
    end
  end
end

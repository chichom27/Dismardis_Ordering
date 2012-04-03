class CreatePedidosProductos < ActiveRecord::Migration
  def change
    create_table :pedidos_productos do |t|
      t.integer :idPedido
      t.integer :idProducto

      t.timestamps
    end
  end
end

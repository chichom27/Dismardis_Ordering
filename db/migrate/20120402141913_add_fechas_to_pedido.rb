class AddFechasToPedido < ActiveRecord::Migration
  def change
    add_column :pedidos, :FechaPedido, :date

    add_column :pedidos, :FechaEntrega, :date

    add_column :pedidos, :idEstado, :int

    add_column :pedidos, :Comentarios, :text

  end
end

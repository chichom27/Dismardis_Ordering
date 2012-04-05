class AddIdUsuarioToPedido < ActiveRecord::Migration
  def change
    add_column :pedidos, :id_usuario, :int

  end
end

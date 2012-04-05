class RemoveIdusuarioFromPedido < ActiveRecord::Migration
  def up
    remove_column :pedidos, :idUsuario
      end

  def down
    add_column :pedidos, :idUsuario, :string
  end
end

class AddTotalToPedido < ActiveRecord::Migration
  def change
    add_column :pedidos, :Total, :decimal

  end
end

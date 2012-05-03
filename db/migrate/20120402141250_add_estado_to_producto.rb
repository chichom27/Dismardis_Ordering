class AddEstadoToProducto < ActiveRecord::Migration
  def change
    add_column :productos, :estado, :bool

  end
end

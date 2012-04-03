class AddEstadoToProducto < ActiveRecord::Migration
  def change
    add_column :productos, :Estado, :bool

  end
end

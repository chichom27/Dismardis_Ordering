class AddPrecioToProducto < ActiveRecord::Migration
  def change
    add_column :productos, :Precio, :decimal

  end
end

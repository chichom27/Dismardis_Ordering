class AddIdProveedorToProducto < ActiveRecord::Migration
  def change
    add_column :productos, :idProveedor, :integer

  end
end

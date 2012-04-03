class CreateCategsProveedors < ActiveRecord::Migration
  def change
    create_table :categs_proveedors do |t|
      t.integer :idProveedor
      t.integer :idCategoria

      t.timestamps
    end
  end
end

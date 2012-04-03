class AddDescuentoToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :Descuento, :decimal

  end
end

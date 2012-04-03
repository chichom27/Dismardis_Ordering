class AddPresentacionToProducto < ActiveRecord::Migration
  def change
    add_column :productos, :Presentacion, :string

  end
end

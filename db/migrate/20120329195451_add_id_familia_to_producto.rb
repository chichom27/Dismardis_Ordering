class AddIdFamiliaToProducto < ActiveRecord::Migration
  def change
    add_column :productos, :idFamilia, :integer

  end
end

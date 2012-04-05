class RemoveIdEmpresaFromProducto < ActiveRecord::Migration
  def up
  end

  def down
  end
  
  def change
    remove_column :productos, :idEmpresa

  end
end

class RemoveIdEmpresaFromUsuario < ActiveRecord::Migration
  def up
  end

  def down
  end
  
  def change
    remove_column :usuarios, :idEmpresa

  end
end

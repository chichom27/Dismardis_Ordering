class RemoveIdEmpresaFromAgencia < ActiveRecord::Migration
  def up
  end

  def down
  end
  
  def change
    remove_column :Usuarios, :idEmpresa

  end
end

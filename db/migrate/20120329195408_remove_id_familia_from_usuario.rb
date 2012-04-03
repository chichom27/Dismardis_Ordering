class RemoveIdFamiliaFromUsuario < ActiveRecord::Migration
  def up
  end

  def down
  end
  
  def change
    remove_column :Usuarios, :idFamilia

  end
end

class RemoveIdFamiliaFromUsuario < ActiveRecord::Migration
  def up
  end

  def down
  end
  
  def change
    remove_column :usuarios, :idFamilia

  end
end

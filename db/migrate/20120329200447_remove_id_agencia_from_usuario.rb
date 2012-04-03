class RemoveIdAgenciaFromUsuario < ActiveRecord::Migration
  def up
  end

  def down
  end
  
  def change
    remove_column :Usuarios, :idAgencia

  end
end

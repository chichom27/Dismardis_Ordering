class RemoveTelefonoToUsuario < ActiveRecord::Migration
  def change
    remove_column :Usuarios, :Telefono

  end
end

class RemoveTelefonoToUsuario < ActiveRecord::Migration
  def change
    remove_column :usuarios, :Telefono

  end
end

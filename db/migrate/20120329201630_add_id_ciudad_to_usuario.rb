class AddIdCiudadToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :idCiudad, :integer

  end
end

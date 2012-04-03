class AddNombreNegocioToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :NombreNegocio, :string

  end
end

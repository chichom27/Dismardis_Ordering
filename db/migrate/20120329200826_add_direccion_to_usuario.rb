class AddDireccionToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :Direccion, :string

  end
end

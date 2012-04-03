class AddZonaToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :Zona, :string

  end
end

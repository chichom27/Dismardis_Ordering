class AddTelefono2ToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :Telefono, :string

  end
end

class AddCedulaToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :Cedula, :integer

  end
end

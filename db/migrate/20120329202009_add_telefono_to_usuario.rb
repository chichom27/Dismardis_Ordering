class AddTelefonoToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :Telefono, :integer

  end
end

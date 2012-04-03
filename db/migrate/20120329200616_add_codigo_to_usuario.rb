class AddCodigoToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :Codigo, :string

  end
end

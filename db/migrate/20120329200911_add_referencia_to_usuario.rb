class AddReferenciaToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :Referencia, :string

  end
end

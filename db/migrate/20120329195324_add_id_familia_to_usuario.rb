class AddIdFamiliaToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :idFamilia, :integer

  end
end

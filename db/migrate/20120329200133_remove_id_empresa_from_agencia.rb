class RemoveIdEmpresaFromAgencia < ActiveRecord::Migration
  def up
  end

  def down
  end
  
  def change
    remove_column :agencia, :idEmpresa

  end
end

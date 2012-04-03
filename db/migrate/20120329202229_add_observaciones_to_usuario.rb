class AddObservacionesToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :Observaciones, :text

  end
end

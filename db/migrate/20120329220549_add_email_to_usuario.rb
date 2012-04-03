class AddEmailToUsuario < ActiveRecord::Migration
  def change
    add_column :usuarios, :Email, :string

  end
end

class AddEmailToProveedor < ActiveRecord::Migration
  def change
    add_column :proveedors, :Email, :string

  end
end

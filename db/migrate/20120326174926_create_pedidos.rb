class CreatePedidos < ActiveRecord::Migration
  def change
    create_table :pedidos do |t|
      t.integer :idUsuario
      t.string :Codigo

      t.timestamps
    end
  end
end

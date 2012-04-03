class CreateProductos < ActiveRecord::Migration
  def change
    create_table :productos do |t|
      t.string :Nombre
      t.integer :idEmpresa
      t.string :Codigo

      t.timestamps
    end
  end
end

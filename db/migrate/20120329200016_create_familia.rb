class CreateFamilia < ActiveRecord::Migration
  def change
    create_table :familia do |t|
      t.string :Nombre
      t.string :Codigo
      t.integer :idCategoria

      t.timestamps
    end
  end
end

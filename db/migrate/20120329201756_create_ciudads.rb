class CreateCiudads < ActiveRecord::Migration
  def change
    create_table :ciudads do |t|
      t.string :Nombre
      t.integer :idProvincia

      t.timestamps
    end
  end
end

class CreateProveedors < ActiveRecord::Migration
  def change
    create_table :proveedors do |t|
      t.string :Codigo
      t.string :Nombre
      t.string :Direccion
      t.string :Telefono
      t.string :Contacto
      t.string :TelContacto
      t.string :RUC

      t.timestamps
    end
  end
end

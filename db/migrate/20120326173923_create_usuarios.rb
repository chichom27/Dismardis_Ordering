class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :Username
      t.string :Password
      t.string :Nombre
      t.string :Apellido
      t.integer :idTipoUsuario
      t.string :codigo
      t.string :cedula
      t.string :Telefono
      t.string :Email
      t.decimal :Descuento
      t.text :Observaciones
      t.integer :idCiudad
      t.string :Direccion
      t.string :Zona
      t.string :Referencia
      t.string :NombreNegocio
      t.integer :createdby      , :null => false

      t.timestamps
    end
    
    
  end
end

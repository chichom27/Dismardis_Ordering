class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :Username
      t.string :Password
      t.string :Nombre
      t.string :Apellido
      t.integer :idEmpresa
      t.integer :idAgencia
      t.integer :idTipoUsuario

      t.timestamps
    end
    
    Usuario.create :Username => 'admin', 
                    :Password => 'password', 
                    :Nombre => 'admin', 
                    :Apellido => 'admin', 
                    :idTipoUsuario => 1, 
                    :idEmpresa => 1, 
                    :idAgencia => 1
  end
end

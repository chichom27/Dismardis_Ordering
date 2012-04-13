class DataToUsuario < ActiveRecord::Migration
  def up
    Usuario.create  :Username => 'admin', 
                    :Password => 'password', 
                    :Nombre => 'admin', 
                    :Apellido => 'admin', 
                    :idTipoUsuario => 1, 
                    :codigo => 'ADMN', 
                    :cedula => '1711979169', 
                    :Telefono => '095361552', 
                    :Email => 'cmestanza@mardisresearch.com', 
                    :Descuento => 0, 
                    :Observaciones => 'algo', 
                    :idCiudad => 1,
                    :Direccion => 'algo', 
                    :Zona => 'algo', 
                    :NombreNegocio => 'algo', 
                    :Referencia => 'algo'
  end

  def down
  end
end

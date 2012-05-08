class DataToUsuario < ActiveRecord::Migration
  require 'digest/sha1'
  
  def up
    Usuario.create  :Username => 'admin', 
                    :Password => Digest::SHA1.hexdigest('password'), 
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
                    :Referencia => 'algo', 
                    :createdby => 1
  end

  def down
  end
end

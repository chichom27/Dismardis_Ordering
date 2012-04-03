class Usuario < ActiveRecord::Base
  has_many :Pedido
  belongs_to :tipoUser, :class_name => "TipoUsuario", :foreign_key => "idTipoUsuario"
  belongs_to :ciud, :class_name => "Ciudad", :foreign_key => "idCiudad"
end

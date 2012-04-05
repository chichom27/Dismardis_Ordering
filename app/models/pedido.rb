class Pedido < ActiveRecord::Base
  has_many :Producto, :through => Item
  belongs_to :user, :class_name => "Usuario", :foreign_key => "id_usuario"
  belongs_to :pestado, :class_name => "EstadoPedido", :foreign_key => "idEstado"
end

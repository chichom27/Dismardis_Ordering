class Pedido < ActiveRecord::Base
  has_many :Producto, :through => Item
  belongs_to :user, :class_name => "Usuario", :foreign_key => "idUsuario"
end

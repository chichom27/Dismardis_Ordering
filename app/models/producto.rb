class Producto < ActiveRecord::Base
  belongs_to :emp, :class_name => "Empresa", :foreign_key => "idEmpresa"
  has_many :Pedido, :through => Item
end

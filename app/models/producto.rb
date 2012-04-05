class Producto < ActiveRecord::Base
  belongs_to :prov, :class_name => "Proveedor", :foreign_key => "idProveedor"
  belongs_to :fam, :class_name => "Familium", :foreign_key => "idFamilia"
  has_many :Pedido, :through => Item
end

class Item < ActiveRecord::Base
  belongs_to :Pedido
  belongs_to :prod, :class_name => "Producto", :foreign_key => "producto_id"
end

class EstadoPedido < ActiveRecord::Base
  has_many :Pedido
end

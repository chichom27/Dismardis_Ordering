class DataToEstadoPedido < ActiveRecord::Migration
  def up
    EstadoPedido.create :Nombre => 'Pendiente'
    EstadoPedido.create :Nombre => 'Aprobado'
    EstadoPedido.create :Nombre => 'Enviado'
    EstadoPedido.create :Nombre => 'Pagado'
    EstadoPedido.create :Nombre => 'Rechazado'
  end

end

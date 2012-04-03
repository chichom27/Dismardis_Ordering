class DataTiposUsuarios < ActiveRecord::Migration
  def up
    TipoUsuario.create :Nombre => 'Admin'
    TipoUsuario.create :Nombre => 'Gerente'
    TipoUsuario.create :Nombre => 'Cajero'
    TipoUsuario.create :Nombre => 'Cliente'
  end
end

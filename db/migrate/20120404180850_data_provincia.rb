 # -*- coding: utf-8 -*-
class DataProvincia < ActiveRecord::Migration
  def up
    Provincium.create :Nombre => 'Azuay'
    Provincium.create :Nombre => 'Bolivar'
    Provincium.create :Nombre => 'Cañar'
    Provincium.create :Nombre => 'Carchi'
    Provincium.create :Nombre => 'Cotopaxi'
    Provincium.create :Nombre => 'Chimborazo'
    Provincium.create :Nombre => 'El Oro'
    Provincium.create :Nombre => 'Esmeraldas'
    Provincium.create :Nombre => 'Guayas'
    Provincium.create :Nombre => 'Imbabura'
    Provincium.create :Nombre => 'Loja'
    Provincium.create :Nombre => 'Los Rios'
    Provincium.create :Nombre => 'Manabi'
    Provincium.create :Nombre => 'Morona Santiago'
    Provincium.create :Nombre => 'Napo'
    Provincium.create :Nombre => 'Pastaza'
    Provincium.create :Nombre => 'Pichincha'
    Provincium.create :Nombre => 'Tungurahua'
    Provincium.create :Nombre => 'Zamora Chinchipe'
    Provincium.create :Nombre => 'Galapagos'
    Provincium.create :Nombre => 'Sucumbios'
    Provincium.create :Nombre => 'Orellana'
    Provincium.create :Nombre => 'Santo Domingo'
    Provincium.create :Nombre => 'Santo Elena'
  end

end

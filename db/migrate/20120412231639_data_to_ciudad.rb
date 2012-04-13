class DataToCiudad < ActiveRecord::Migration
  def up
    Ciudad.create :Nombre => 'Quito',
                  :idProvincia => 17
  end

  def down
  end
end

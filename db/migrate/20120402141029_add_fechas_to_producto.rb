class AddFechasToProducto < ActiveRecord::Migration
  def change
    add_column :productos, :FechaInicio, :date

    add_column :productos, :FechaCaducidad, :date

  end
end

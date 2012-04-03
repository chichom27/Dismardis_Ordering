class CreateAgencia < ActiveRecord::Migration
  def change
    create_table :agencia do |t|
      t.string :Nombre
      t.integer :idEmpresa
      t.string :Codigo

      t.timestamps
    end
  end
end

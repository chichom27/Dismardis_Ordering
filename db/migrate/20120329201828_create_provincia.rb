class CreateProvincia < ActiveRecord::Migration
  def change
    create_table :provincia do |t|
      t.string :Nombre

      t.timestamps
    end
  end
end

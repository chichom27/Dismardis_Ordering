class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :pedido_id
      t.integer :producto_id
      t.integer :cantidad

      t.timestamps
    end
  end
end

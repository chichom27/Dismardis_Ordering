# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120402142025) do

  create_table "agencia", :force => true do |t|
    t.string   "Nombre"
    t.string   "Codigo"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categoria", :force => true do |t|
    t.string   "Nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categs_proveedors", :force => true do |t|
    t.integer  "idProveedor"
    t.integer  "idCategoria"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "ciudads", :force => true do |t|
    t.string   "Nombre"
    t.integer  "idProvincia"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "estado_pedidos", :force => true do |t|
    t.string   "Nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "familia", :force => true do |t|
    t.string   "Nombre"
    t.string   "Codigo"
    t.integer  "idCategoria"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "items", :force => true do |t|
    t.integer  "pedido_id"
    t.integer  "producto_id"
    t.integer  "cantidad"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pedidos", :force => true do |t|
    t.integer  "idUsuario"
    t.string   "Codigo"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.date     "FechaPedido"
    t.date     "FechaEntrega"
    t.integer  "idEstado"
    t.text     "Comentarios"
  end

  create_table "pedidos_productos", :force => true do |t|
    t.integer  "idPedido"
    t.integer  "idProducto"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "productos", :force => true do |t|
    t.string   "Nombre"
    t.integer  "idEmpresa"
    t.string   "Codigo"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "idFamilia"
    t.decimal  "Precio"
    t.integer  "idProveedor"
    t.date     "FechaInicio"
    t.date     "FechaCaducidad"
    t.boolean  "Estado"
    t.string   "Presentacion"
  end

  create_table "proveedors", :force => true do |t|
    t.string   "Codigo"
    t.string   "Nombre"
    t.string   "Direccion"
    t.string   "Telefono"
    t.string   "Contacto"
    t.string   "TelContacto"
    t.string   "RUC"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "Email"
  end

  create_table "provincia", :force => true do |t|
    t.string   "Nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "tipo_usuarios", :force => true do |t|
    t.string   "Nombre"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.string   "Username"
    t.string   "Password"
    t.string   "Nombre"
    t.string   "Apellido"
    t.integer  "idTipoUsuario"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "Codigo"
    t.string   "NombreNegocio"
    t.string   "Direccion"
    t.string   "Referencia"
    t.string   "Zona"
    t.integer  "idCiudad"
    t.integer  "Cedula"
    t.text     "Observaciones"
    t.decimal  "Descuento"
    t.string   "Email"
    t.string   "Telefono"
  end

end

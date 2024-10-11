# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_10_10_202421) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clientes", force: :cascade do |t|
    t.string "nombre"
    t.string "email"
    t.string "telefono"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "detalle_pedidos", force: :cascade do |t|
    t.bigint "pedido_id", null: false
    t.bigint "producto_id", null: false
    t.integer "cantidad"
    t.decimal "precio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pedido_id"], name: "index_detalle_pedidos_on_pedido_id"
    t.index ["producto_id"], name: "index_detalle_pedidos_on_producto_id"
  end

  create_table "pedidos", force: :cascade do |t|
    t.bigint "cliente_id", null: false
    t.datetime "fecha"
    t.decimal "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_pedidos_on_cliente_id"
  end

  create_table "productos", force: :cascade do |t|
    t.string "nombre"
    t.text "descripcion"
    t.decimal "precio"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "detalle_pedidos", "pedidos"
  add_foreign_key "detalle_pedidos", "productos"
  add_foreign_key "pedidos", "clientes"
end
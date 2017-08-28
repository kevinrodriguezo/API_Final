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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170819180930) do

  create_table "clients", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.string   "cedula"
    t.string   "pagina"
    t.string   "direccion"
    t.integer  "telefono"
    t.string   "sector"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.string   "telefono"
    t.string   "puesto"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.integer  "clients_id"
    t.index ["clients_id"], name: "index_contacts_on_clients_id", using: :btree
  end

  create_table "reunions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "titulo"
    t.boolean  "virtual"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "users_id"
    t.integer  "clients_id"
    t.index ["clients_id"], name: "index_reunions_on_clients_id", using: :btree
    t.index ["users_id"], name: "index_reunions_on_users_id", using: :btree
  end

  create_table "supports", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "titulo"
    t.string   "detalle"
    t.string   "estado"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "users_id"
    t.integer  "clients_id"
    t.index ["clients_id"], name: "index_supports_on_clients_id", using: :btree
    t.index ["users_id"], name: "index_supports_on_users_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nombre"
    t.string   "apellido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "contacts", "clients", column: "clients_id"
  add_foreign_key "reunions", "clients", column: "clients_id"
  add_foreign_key "reunions", "users", column: "users_id"
  add_foreign_key "supports", "clients", column: "clients_id"
  add_foreign_key "supports", "users", column: "users_id"
end

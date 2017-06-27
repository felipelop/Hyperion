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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170627003251) do

  create_table "clientes", force: :cascade do |t|
    t.string   "cpf"
    t.string   "nome"
    t.integer  "idade"
    t.decimal  "renda"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "financiamentos", force: :cascade do |t|
    t.integer  "cliente_id"
    t.integer  "imovel_id"
    t.decimal  "juros"
    t.decimal  "parcela"
    t.decimal  "entrada"
    t.decimal  "subsidio"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "meses"
  end

  add_index "financiamentos", ["cliente_id"], name: "index_financiamentos_on_cliente_id"
  add_index "financiamentos", ["imovel_id"], name: "index_financiamentos_on_imovel_id"

  create_table "imovels", force: :cascade do |t|
    t.string   "nome"
    t.integer  "unidade"
    t.decimal  "valor"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "login"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "password_digest"
  end

end

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

ActiveRecord::Schema[7.1].define(version: 2024_07_19_184855) do
  create_table "avaliacaos", force: :cascade do |t|
    t.string "nome"
    t.text "descricao"
    t.float "nota"
    t.integer "peso"
    t.date "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "disciplina_id"
    t.index ["disciplina_id"], name: "index_avaliacaos_on_disciplina_id"
  end

  create_table "disciplinas", force: :cascade do |t|
    t.string "nome", null: false
    t.integer "carga_horaria", null: false
    t.integer "creditos", null: false
    t.integer "faltas", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "periodo_id"
    t.text "topics", default: "[]"
    t.index ["periodo_id"], name: "index_disciplinas_on_periodo_id"
  end

  create_table "periodos", force: :cascade do |t|
    t.string "nome", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.integer "periodo_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["periodo_id"], name: "index_users_on_periodo_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["username"], name: "index_users_on_username", unique: true
  end

  add_foreign_key "avaliacaos", "disciplinas"
  add_foreign_key "disciplinas", "periodos"
  add_foreign_key "users", "periodos"
end

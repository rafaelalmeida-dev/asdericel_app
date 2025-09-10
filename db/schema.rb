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

ActiveRecord::Schema[7.2].define(version: 2025_09_10_004027) do
  create_table "associados", force: :cascade do |t|
    t.string "nome"
    t.string "nome_social"
    t.string "nome_conhecido"
    t.string "mae"
    t.string "pai"
    t.date "data_nascimento"
    t.integer "sexo"
    t.string "cpf"
    t.string "rg"
    t.string "orgao_emissor"
    t.date "data_expedicao"
    t.string "passaporte"
    t.integer "estado_civil"
    t.string "profissao"
    t.integer "ensino"
    t.string "celular"
    t.string "email"
    t.string "instagram"
    t.string "observacao"
    t.integer "tipo_cadastro"
    t.integer "endereco_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["endereco_id"], name: "index_associados_on_endereco_id"
  end

  create_table "cidades", force: :cascade do |t|
    t.string "nome"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "cep"
    t.string "logradouro"
    t.string "bairro"
    t.string "localidade"
    t.string "uf"
    t.string "pais"
    t.string "numero"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "associados", "enderecos"
end

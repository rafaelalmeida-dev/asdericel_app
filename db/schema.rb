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

ActiveRecord::Schema[7.2].define(version: 2025_09_27_000030) do
  create_table "associados", force: :cascade do |t|
    t.string "celular"
    t.string "email"
    t.string "instagram"
    t.string "observacao"
    t.integer "pessoa_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pessoa_id"], name: "index_associados_on_pessoa_id"
  end

  create_table "atletas", force: :cascade do |t|
    t.string "numeroSus"
    t.string "peso"
    t.string "altura"
    t.integer "pessoa_id"
    t.integer "camisa_id"
    t.integer "calca_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ensino_id"
    t.index ["calca_id"], name: "index_atletas_on_calca_id"
    t.index ["camisa_id"], name: "index_atletas_on_camisa_id"
    t.index ["ensino_id"], name: "index_atletas_on_ensino_id"
    t.index ["pessoa_id"], name: "index_atletas_on_pessoa_id"
  end

  create_table "calcas", force: :cascade do |t|
    t.string "numero"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "camisas", force: :cascade do |t|
    t.string "numero"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categoria", force: :cascade do |t|
    t.string "nome"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cidades", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
    t.integer "estado_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estado_id"], name: "index_cidades_on_estado_id"
  end

  create_table "enderecos", force: :cascade do |t|
    t.string "cep"
    t.string "bairro"
    t.integer "numero"
    t.integer "cidade_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pessoa_id", null: false
    t.index ["cidade_id"], name: "index_enderecos_on_cidade_id"
    t.index ["pessoa_id"], name: "index_enderecos_on_pessoa_id"
  end

  create_table "ensinos", force: :cascade do |t|
    t.string "nome"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "equipes", force: :cascade do |t|
    t.string "nome"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "escolas", force: :cascade do |t|
    t.string "nome"
    t.string "inep"
    t.string "telefone"
    t.string "municipio"
    t.string "estado"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estadocivils", force: :cascade do |t|
    t.string "nome"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "estados", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
    t.integer "pais_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pais_id"], name: "index_estados_on_pais_id"
  end

  create_table "eventos", force: :cascade do |t|
    t.string "nome"
    t.string "edicacao"
    t.string "promotor"
    t.string "local"
    t.datetime "datainicio"
    t.datetime "datafim"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "federacaos", force: :cascade do |t|
    t.string "sigla"
    t.string "nome"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "funcaos", force: :cascade do |t|
    t.string "nome"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "paises", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "parentescos", force: :cascade do |t|
    t.string "nome"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pessoas", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.integer "cinrg"
    t.string "sexo"
    t.string "telefone"
    t.string "email"
    t.date "data_nascimento"
    t.integer "endereco_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "nomeconhecido"
    t.string "pai"
    t.string "mae"
    t.string "orgaoemissor"
    t.date "dataexpedicao"
    t.string "passaporte"
    t.integer "funcao_id"
    t.integer "sexo_id"
    t.integer "estadocivil_id"
    t.string "nomesocial"
    t.index ["endereco_id"], name: "index_pessoas_on_endereco_id"
    t.index ["estadocivil_id"], name: "index_pessoas_on_estadocivil_id"
    t.index ["funcao_id"], name: "index_pessoas_on_funcao_id"
    t.index ["sexo_id"], name: "index_pessoas_on_sexo_id"
  end

  create_table "responsavels", force: :cascade do |t|
    t.string "nome"
    t.string "rg"
    t.string "cpf"
    t.string "telefone"
    t.string "email"
    t.integer "parentesco_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parentesco_id"], name: "index_responsavels_on_parentesco_id"
  end

  create_table "sexos", force: :cascade do |t|
    t.string "nome"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
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
    t.datetime "deleted_at"
    t.string "cpf", null: false
    t.index ["cpf"], name: "index_users_on_cpf", unique: true
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "associados", "pessoas"
  add_foreign_key "atletas", "calcas"
  add_foreign_key "atletas", "camisas"
  add_foreign_key "atletas", "ensinos"
  add_foreign_key "atletas", "pessoas"
  add_foreign_key "cidades", "estados"
  add_foreign_key "enderecos", "cidades"
  add_foreign_key "enderecos", "pessoas"
  add_foreign_key "estados", "paises"
  add_foreign_key "pessoas", "enderecos"
  add_foreign_key "pessoas", "estadocivils"
  add_foreign_key "pessoas", "funcaos"
  add_foreign_key "pessoas", "sexos"
  add_foreign_key "responsavels", "parentescos"
end

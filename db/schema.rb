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

ActiveRecord::Schema[7.2].define(version: 2025_10_08_182316) do
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

  create_table "atleta_federacaos", force: :cascade do |t|
    t.string "numero"
    t.integer "atleta_id"
    t.integer "federacao_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atleta_id"], name: "index_atleta_federacaos_on_atleta_id"
    t.index ["federacao_id"], name: "index_atleta_federacaos_on_federacao_id"
  end

  create_table "atleta_federacoes", force: :cascade do |t|
    t.string "numero"
    t.integer "atleta_id"
    t.integer "federacao_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atleta_id"], name: "index_atleta_federacoes_on_atleta_id"
    t.index ["federacao_id"], name: "index_atleta_federacoes_on_federacao_id"
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
    t.integer "escola_id"
    t.index ["calca_id"], name: "index_atletas_on_calca_id"
    t.index ["camisa_id"], name: "index_atletas_on_camisa_id"
    t.index ["ensino_id"], name: "index_atletas_on_ensino_id"
    t.index ["escola_id"], name: "index_atletas_on_escola_id"
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

  create_table "federacoes", force: :cascade do |t|
    t.string "nome"
    t.string "sigla"
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

  create_table "modalidades", force: :cascade do |t|
    t.string "nome"
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
    t.string "nomesocial"
    t.string "nomeconhecido"
    t.string "pai"
    t.string "mae"
    t.date "datanascimento"
    t.string "cpf"
    t.integer "cinrg"
    t.string "orgaoemissor"
    t.date "dataexpedicao"
    t.string "passaporte"
    t.integer "sexo_id"
    t.integer "estadocivil_id"
    t.integer "funcao_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "roles", force: :cascade do |t|
    t.string "nome"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "nome", null: false
    t.integer "role_id", null: false
    t.index ["cpf"], name: "index_users_on_cpf", unique: true
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role_id"], name: "index_users_on_role_id"
  end

  add_foreign_key "associados", "pessoas"
  add_foreign_key "atleta_federacaos", "atletas"
  add_foreign_key "atleta_federacaos", "federacoes"
  add_foreign_key "atleta_federacoes", "atletas"
  add_foreign_key "atleta_federacoes", "federacoes"
  add_foreign_key "atletas", "calcas"
  add_foreign_key "atletas", "camisas"
  add_foreign_key "atletas", "ensinos"
  add_foreign_key "atletas", "escolas"
  add_foreign_key "atletas", "pessoas"
  add_foreign_key "pessoas", "estadocivils"
  add_foreign_key "pessoas", "funcaos"
  add_foreign_key "pessoas", "sexos"
  add_foreign_key "responsavels", "parentescos"
  add_foreign_key "users", "roles"
end

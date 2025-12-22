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

<<<<<<< HEAD
<<<<<<< HEAD
ActiveRecord::Schema[7.2].define(version: 2025_12_18_215154) do
=======
ActiveRecord::Schema[7.2].define(version: 2025_12_20_023139) do
>>>>>>> 660cd8a (criado partes de noticias)
=======
ActiveRecord::Schema[7.2].define(version: 2025_12_21_000132) do
>>>>>>> 38b1cad (adicionado categorias)
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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

  create_table "atletaequipes", force: :cascade do |t|
    t.bigint "atleta_id"
    t.bigint "equipe_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["atleta_id"], name: "index_atletaequipes_on_atleta_id"
    t.index ["equipe_id"], name: "index_atletaequipes_on_equipe_id"
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

  create_table "categorias", force: :cascade do |t|
    t.string "nome", null: false
    t.string "sexo", null: false
    t.integer "idade", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.index ["idade"], name: "index_categorias_on_idade"
    t.index ["nome"], name: "index_categorias_on_nome"
    t.index ["sexo"], name: "index_categorias_on_sexo"
  end

  create_table "dirigentes", force: :cascade do |t|
    t.string "cref"
    t.integer "pessoa_id"
    t.integer "modalidade_id"
    t.integer "federacao_id"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ensino_id"
    t.integer "camisa_id"
    t.integer "calca_id"
    t.string "peso"
    t.string "altura"
    t.string "numeroSus"
    t.string "profissao"
    t.string "celular"
    t.string "instagram"
    t.index ["calca_id"], name: "index_dirigentes_on_calca_id"
    t.index ["camisa_id"], name: "index_dirigentes_on_camisa_id"
    t.index ["ensino_id"], name: "index_dirigentes_on_ensino_id"
    t.index ["federacao_id"], name: "index_dirigentes_on_federacao_id"
    t.index ["modalidade_id"], name: "index_dirigentes_on_modalidade_id"
    t.index ["pessoa_id"], name: "index_dirigentes_on_pessoa_id"
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
    t.bigint "modalidade_id"
    t.bigint "categoria_id"
    t.index ["categoria_id"], name: "index_equipes_on_categoria_id"
    t.index ["modalidade_id"], name: "index_equipes_on_modalidade_id"
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

  create_table "noticia", force: :cascade do |t|
    t.string "titulo"
    t.text "conteudo"
    t.string "categoria"
    t.string "imagem"
    t.date "data_publicacao"
    t.boolean "destaque"
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "noticias", force: :cascade do |t|
    t.string "titulo"
    t.text "conteudo"
    t.string "categoria"
    t.string "imagem"
    t.date "data_publicacao"
    t.boolean "destaque", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["categoria"], name: "index_noticias_on_categoria"
    t.index ["data_publicacao"], name: "index_noticias_on_data_publicacao"
    t.index ["destaque"], name: "index_noticias_on_destaque"
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
    t.string "created_by"
    t.string "updated_by"
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["estadocivil_id"], name: "index_pessoas_on_estadocivil_id"
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

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "associados", "pessoas"
  add_foreign_key "atleta_federacaos", "atletas"
  add_foreign_key "atleta_federacaos", "federacoes"
  add_foreign_key "atleta_federacoes", "atletas"
  add_foreign_key "atleta_federacoes", "federacoes"
  add_foreign_key "atletaequipes", "atletas"
  add_foreign_key "atletaequipes", "equipes"
  add_foreign_key "atletas", "calcas"
  add_foreign_key "atletas", "camisas"
  add_foreign_key "atletas", "ensinos"
  add_foreign_key "atletas", "escolas"
  add_foreign_key "atletas", "pessoas"
  add_foreign_key "dirigentes", "calcas"
  add_foreign_key "dirigentes", "camisas"
  add_foreign_key "dirigentes", "ensinos"
  add_foreign_key "dirigentes", "federacoes"
  add_foreign_key "dirigentes", "modalidades"
  add_foreign_key "dirigentes", "pessoas"
  add_foreign_key "equipes", "modalidades"
  add_foreign_key "pessoas", "estadocivils"
  add_foreign_key "pessoas", "sexos"
  add_foreign_key "responsavels", "parentescos"
  add_foreign_key "users", "roles"
end

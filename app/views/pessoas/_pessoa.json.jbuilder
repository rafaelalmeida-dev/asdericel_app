json.extract! pessoa, :id, :nome, :cpf, :rg, :sexo, :telefone, :email, :data_nascimento, :endereco_id, :created_at, :updated_at
json.url pessoa_url(pessoa, format: :json)

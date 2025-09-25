json.extract! pessoa, :id, :nome, :nomesocial, :nomeconhecido, :pai, :mae, :datanascimento, :cpf, :cinrg, :orgaoemissor, :dataexpedicao, :passaporte, :profissao, :sexo_id, :estadocivil_id, :ensino_id, :funcao_id, :created_at, :updated_at
json.url pessoa_url(pessoa, format: :json)

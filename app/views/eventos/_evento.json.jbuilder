json.extract! evento, :id, :nome, :edicacao, :promotor, :local, :datainicio, :datafim, :created_at, :updated_at
json.url evento_url(evento, format: :json)

json.extract! evento, :id, :nome, :edicao, :categoria, :municipio, :estado, :pais, :created_at, :updated_at
json.url evento_url(evento, format: :json)

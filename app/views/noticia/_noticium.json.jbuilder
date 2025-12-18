json.extract! noticium, :id, :titulo, :conteudo, :categoria, :imagem, :data_publicacao, :destaque, :created_at, :updated_at
json.url noticium_url(noticium, format: :json)

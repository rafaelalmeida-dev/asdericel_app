json.extract! noticia, :id, :titulo, :conteudo, :categoria, :imagem, :data_publicacao, :destaque, :created_at, :updated_at
json.url noticia_url(noticia, format: :json)

class Noticia < ApplicationRecord
  self.table_name = "noticias"

<<<<<<< HEAD
  has_one_attached :imagem_upload

  validates :titulo, :conteudo, :categoria, :data_publicacao, presence: true
=======
  validates :titulo, presence: true
  validates :conteudo, presence: true
  validates :categoria, presence: true
  validates :data_publicacao, presence: true
>>>>>>> 5627994 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)

  scope :destaques, -> { where(destaque: true).order(data_publicacao: :desc) }
  scope :recentes, -> { order(data_publicacao: :desc) }
  scope :por_categoria, ->(categoria) { where(categoria: categoria) if categoria.present? }

<<<<<<< HEAD
  CATEGORIAS = [ "FUTEBOL", "ATLETISMO", "CLUBE", "FUTSAL", "FUTCAMPO", "SOCCER SOCIETY" ].freeze
=======
<<<<<<< HEAD
  CATEGORIAS = ["FUTEBOL", "ATLETISMO", "CLUBE", "FUTSAL", "FUTCAMPO", "SOCCER SOCIETY"].freeze
>>>>>>> e898f74 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)

  def self.ransackable_attributes(auth_object = nil)
    %w[titulo categoria data_publicacao destaque]
=======
  CATEGORIAS = [ "FUTEBOL", "ATLETISMO", "CLUBE", "FUTSAL", "FUTCAMPO", "SOCCER SOCIETY" ].freeze

  def self.ransackable_attributes(auth_object = nil)
    [ "titulo", "categoria", "data_publicacao", "destaque" ]
>>>>>>> 5627994 (refactor: refatoracoes de scaffold: estado_civil, funcao, responsavel, atleta_equipe, noticia.)
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end

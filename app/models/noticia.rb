class Noticia < ApplicationRecord
  has_one_attached :imagem_upload

  validates :titulo, :conteudo, :categoria, :data_publicacao, presence: true

  scope :destaques, -> { where(destaque: true).order(data_publicacao: :desc) }
  scope :recentes, -> { order(data_publicacao: :desc) }
  scope :por_categoria, ->(categoria) { where(categoria: categoria) if categoria.present? }

  CATEGORIAS = [ "FUTEBOL", "ATLETISMO", "CLUBE", "FUTSAL", "FUTCAMPO", "SOCCER SOCIETY" ].freeze

  def self.ransackable_attributes(auth_object = nil)
    %w[titulo categoria data_publicacao destaque]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[]
  end
end

class Noticia < ApplicationRecord
  self.table_name = 'noticia' 
  
  validates :titulo, presence: true
  validates :conteudo, presence: true
  validates :categoria, presence: true
  validates :data_publicacao, presence: true
  
  scope :destaques, -> { where(destaque: true).order(data_publicacao: :desc) }
  scope :recentes, -> { order(data_publicacao: :desc) }
  scope :por_categoria, ->(categoria) { where(categoria: categoria) if categoria.present? }
  
  CATEGORIAS = ['FUTEBOL', 'ATLETISMO', 'CLUBE', 'FUTSAL', 'FUTCAMPO', 'SOCCER SOCIETY'].freeze
  
  def self.ransackable_attributes(auth_object = nil)
    ["titulo", "categoria", "data_publicacao", "destaque"]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end

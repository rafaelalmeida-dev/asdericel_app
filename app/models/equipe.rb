# frozen_string_literal: true

# Associações:

# Atributos:
# string - nome

# Adicione aqui quaisquer métodos ou validações abaixo
class Equipe < ApplicationRecord
  include Datafilter
  belongs_to :modalidade
  belongs_to :categoria
  has_many :atletaequipes
  has_many :atletas, through: :atletaequipes
  
  validates :nome, presence: true
  validates :modalidade_id, presence: true

  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    # array de strings
    %w[
      nome
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
      modalidade
      categoria
    ]
  end
end

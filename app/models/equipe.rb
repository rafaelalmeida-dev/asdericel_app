# frozen_string_literal: true

# Associações:

# Atributos:
# string - nome

# Adicione aqui quaisquer métodos ou validações abaixo
class Equipe < ApplicationRecord
  include Datafilter

  belongs_to :modalidade

  has_many :atleta_equipes, dependent: :destroy
  has_many :atletas, through: :atleta_equipes

  validates :nome, presence: true
  validates :modalidade_id, presence: true

  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[
      nome
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
      modalidade
    ]
  end
end

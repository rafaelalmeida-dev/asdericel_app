# frozen_string_literal: true

# Associações:
# pessoa
# camisa
# calca

# Atributos:
# string - numeroSus
# string - peso
# string - altura

# Adicione aqui quaisquer métodos ou validações abaixo
class Atleta < ApplicationRecord
  include Datafilter

  belongs_to :pessoa
  belongs_to :ensino, optional: true
  belongs_to :camisa, optional: true
  belongs_to :calca, optional: true
  belongs_to :escola, optional: true

  has_many   :modalidades
  has_many   :atleta_federacoes, dependent: :destroy
  has_many   :federacoes, through: :atleta_federacoes

  accepts_nested_attributes_for :pessoa
  accepts_nested_attributes_for :atleta_federacoes, allow_destroy: true

  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    # array de strings
    %w[
      numeroSus
      peso
      altura
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
      pessoa
      camisa
      calca
    ]
  end
end

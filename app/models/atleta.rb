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
  accepts_nested_attributes_for :pessoa
  belongs_to :camisa
  belongs_to :calca
  belongs_to :ensino

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

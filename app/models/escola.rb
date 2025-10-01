# frozen_string_literal: true

# Associações:
# ensino

# Atributos:
# string - nome
# string - inep
# string - telefone
# string - municipio
# string - estado

# Adicione aqui quaisquer métodos ou validações abaixo
class Escola < ApplicationRecord
  include Datafilter

  belongs_to :ensino
  belongs_to :municipio
  belongs_to :estado

  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    # array de strings
    %w[
      nome
      inep
      telefone
      municipio
      estado
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
    ]
  end
end

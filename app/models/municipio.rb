# frozen_string_literal: true

# Associações:
# estado

# Atributos:
# string - nome

# Adicione aqui quaisquer métodos ou validações abaixo
class Municipio < ApplicationRecord
  include Datafilter

  belongs_to :estado

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
      estado
    ]
  end
end

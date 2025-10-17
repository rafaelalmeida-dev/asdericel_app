# frozen_string_literal: true

# Associações:

# Atributos:
# string - nome
# string - sigla

# Adicione aqui quaisquer métodos ou validações abaixo
class Cidade < ApplicationRecord
  include Datafilter


  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    # array de strings
    %w[
      nome
      sigla
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
    ]
  end
end

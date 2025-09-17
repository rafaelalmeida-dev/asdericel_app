# frozen_string_literal: true

# Associações:

# Atributos:
# string - sigla
# string - nome

# Adicione aqui quaisquer métodos ou validações abaixo
class Federacao < ApplicationRecord
  include Datafilter


  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    # array de strings
    %w[
      sigla
      nome
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
    ]
  end
end

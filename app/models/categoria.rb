# frozen_string_literal: true

# Associações:

# Atributos:
# string - nome

# Adicione aqui quaisquer métodos ou validações abaixo
class Categoria < ApplicationRecord
  include Datafilter
  self.table_name = "categorias"

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
    ]
  end
end

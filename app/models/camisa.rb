# frozen_string_literal: true

# Associações:

# Atributos:
# string - numero

# Adicione aqui quaisquer métodos ou validações abaixo
class Camisa < ApplicationRecord
  include Datafilter


  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    # array de strings
    %w[
      numero
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
    ]
  end
  def to_s
    numero
  end
end

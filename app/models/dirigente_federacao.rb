# frozen_string_literal: true

# Associações:
# dirigente
# federacao

# Atributos:
# string - numero

# Adicione aqui quaisquer métodos ou validações abaixo
class DirigenteFederacao < ApplicationRecord
  include Datafilter

  belongs_to :dirigente
  belongs_to :federacao

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
      dirigente
      federacao
    ]
  end
end

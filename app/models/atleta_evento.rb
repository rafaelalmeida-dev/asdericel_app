# frozen_string_literal: true

# Associações:
# atleta
# evento

# Atributos:

# Adicione aqui quaisquer métodos ou validações abaixo
class AtletaEvento < ApplicationRecord
  include Datafilter

  belongs_to :atleta
  belongs_to :evento

  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    # array de strings
    %w[
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
      atleta
      evento
    ]
  end
end

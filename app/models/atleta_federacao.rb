# frozen_string_literal: true

# Associações:
# atleta
# federacao

# Atributos:
# string - numero

# Adicione aqui quaisquer métodos ou validações abaixo
class AtletaFederacao < ApplicationRecord
  include Datafilter

  belongs_to :atleta
  belongs_to :federacao

  validates :federacao_id, presence: true

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
      atleta
      federacao
    ]
  end
end

# frozen_string_literal: true

# Associações:
# atleta
# modalidade

# Atributos:

# Adicione aqui quaisquer métodos ou validações abaixo
class AtletaModalidade < ApplicationRecord
  include Datafilter

  belongs_to :atleta
  belongs_to :modalidade

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
      modalidade
    ]
  end
end

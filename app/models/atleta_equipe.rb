# frozen_string_literal: true

# Associações:
# atleta
# equipe

# Atributos:
class AtletaEquipe < ApplicationRecord
  include Datafilter

  belongs_to :atleta
  belongs_to :equipe

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
      equipe
    ]
  end
end

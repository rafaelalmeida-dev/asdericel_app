# frozen_string_literal: true

# Associações:
# parentesco

# Atributos:
# string - nome
# string - rg
# string - cpf
# string - telefone
# string - email

# Adicione aqui quaisquer métodos ou validações abaixo
class Responsavel < ApplicationRecord
  include Datafilter

  belongs_to :parentesco

  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    # array de strings
    %w[
      nome
      rg
      cpf
      telefone
      email
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
      parentesco
    ]
  end
end

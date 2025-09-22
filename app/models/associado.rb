# frozen_string_literal: true

# Associações:
# pessoa

# Atributos:
# string - celular
# string - email
# string - instagram
# string - observacao

# Adicione aqui quaisquer métodos ou validações abaixo
class Associado < ApplicationRecord
  include Datafilter

  belongs_to :pessoa  
  accepts_nested_attributes_for :pessoa

  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    # array de strings
    %w[
      celular
      email
      instagram
      observacao
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
      pessoa
    ]
  end
end

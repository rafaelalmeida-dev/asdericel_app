# frozen_string_literal: true

# Associações:
# cidade

# Atributos:
# string - cep
# string - bairro
# integer - numero

# Adicione aqui quaisquer métodos ou validações abaixo
class Endereco < ApplicationRecord
  include Datafilter

  belongs_to :pessoa, inverse_of: :endereco
  belongs_to :cidade

  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[
      cep
      bairro
      numero
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
      cidade
    ]
  end
end

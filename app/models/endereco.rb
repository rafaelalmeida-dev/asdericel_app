# frozen_string_literal: true

# Associações:
# cidade
# estado
# pais

# Atributos:
# string - cep
# string - rua
# string - bairro
# integer - numero

# Adicione aqui quaisquer métodos ou validações abaixo
class Endereco < ApplicationRecord
  include Datafilter

  belongs_to :cidade
  belongs_to :estado
  belongs_to :pais

  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    # array de strings
    %w[
      cep
      rua
      bairro
      numero
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
      cidade
      estado
      pais
    ]
  end
end

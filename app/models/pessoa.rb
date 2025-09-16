# frozen_string_literal: true

# Associações:
# endereco

# Atributos:
# string - nome
# string - cpf
# string - rg
# string - sexo
# string - telefone
# string - email
# date - data_nascimento

# Adicione aqui quaisquer métodos ou validações abaixo
class Pessoa < ApplicationRecord
  include Datafilter

  has_one :endereco, inverse_of: :pessoa
  accepts_nested_attributes_for :endereco

  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    %w[
      nome
      cpf
      rg
      sexo
      telefone
      email
      data_nascimento
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
      endereco
    ]
  end
end

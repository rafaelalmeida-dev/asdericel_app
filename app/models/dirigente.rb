# frozen_string_literal: true

# Associações:
# pessoa
# modalidade
# federacao

# Atributos:
# string - cref

# Adicione aqui quaisquer métodos ou validações abaixo
class Dirigente < ApplicationRecord
  include Datafilter

  belongs_to :pessoa
  belongs_to :modalidade
  belongs_to :federacao
  belongs_to :calca
  belongs_to :camisa
  belongs_to :ensino
  belongs_to :endereco

    accepts_nested_attributes_for :pessoa
    accepts_nested_attributes_for :endereco

  # Permitir os atributos buscáveis pelo Ransack
  def self.ransackable_attributes(auth_object = nil)
    # array de strings
    %w[
      cref
    ]
  end

  # Permitir as associações buscáveis pelo Ransack
  def self.ransackable_associations(auth_object = nil)
    %w[
      pessoa
      modalidade
      federacao
    ]
  end
end
